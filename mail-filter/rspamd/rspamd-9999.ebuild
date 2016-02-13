# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils user eutils git-2 autotools

DESCRIPTION="Rapid spam filtering system"
SRC_URI=""
EGIT_REPO_URI="git://github.com/vstakhov/rspamd.git"
HOMEPAGE="https://github.com/vstakhov/rspamd"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+jit debug +static-libs"

DEPEND="dev-libs/openssl:0
		jit? (
			dev-libs/libpcre[jit]
			dev-lang/luajit:2
		)
		!jit? (
			dev-libs/libpcre[-jit]
			>=dev-lang/lua-5.1:0
		)
		dev-libs/libevent
		dev-db/sqlite:3
		dev-libs/glib:2
		dev-libs/gmime
		sys-apps/file
		virtual/libiconv"
RDEPEND="${DEPEND}"
CDEPEND="${DEPEND}"

src_unpack() {
	git-2_src_unpack
}

pkg_setup() {
	enewgroup rspamd
	enewuser rspamd -1 -1 /var/lib/rspamd rspamd
}

src_configure() {
	local mycmakeargs=(
		-DCONFDIR=/etc/rspamd
		-DRUNDIR=/var/run/rspamd
		-DDBDIR=/var/lib/rspamd
		-DLOGDIR=/var/log/rspamd
	)
	if ! use jit; then
		mycmakeargs="${mycmakeargs} -DENABLE_LUAJIT=OFF"
	fi
	if use debug; then
		mycmakeargs="${mycmakeargs} -DDEBUG_MODE=ON"
	fi
	if ! use static-libs; then
		mycmakeargs="${mycmakeargs} -DNO_SHARED=OFF"
	fi
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	newinitd "${FILESDIR}/rspamd.initd" rspamd
	newconfd "${FILESDIR}/rspamd.confd" rspamd
	dodir /var/lib/rspamd
	dodir /var/lib/rspamd/dynamic
	dodir /var/log/rspamd
	fowners rspamd:rspamd /var/lib/rspamd /var/lib/rspamd/dynamic /var/log/rspamd
	insinto /etc/logrotate.d
	newins "${FILESDIR}/rspamd.logrotate" rspamd
}
