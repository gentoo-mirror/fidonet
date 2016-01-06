# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils user

DESCRIPTION="Rapid spam filtering system"
SRC_URI="http://distfiles.overlay.junc.org/fidonet/rspamd-1.1.tar.xz"
HOMEPAGE="https://github.com/vstakhov/rspamd"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/libpcre
		mail-filter/libmilter
		mail-filter/opendkim
		mail-filter/libspf2
		dev-lang/luajit:2
		dev-libs/libevent
		dev-db/sqlite:3
		dev-libs/glib:2
		dev-libs/gmime
		dev-libs/hiredis"
RDEPEND="${DEPEND}"

# S=${WORKDIR}/rspamd-master

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
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	newinitd "${FILESDIR}/rspamd.init" rspamd
	dodir /var/lib/rspamd
	dodir /var/lib/rspamd/dynamic
	dodir /var/log/rspamd
	dodir /var/run/rspamd
	fowners rspamd:rspamd /var/lib/rspamd /var/lib/rspamd/dynamic /var/log/rspamd /var/run/rspamd
	insinto /etc/logrotate.d
	newins "${FILESDIR}/rspamd.logrotate" rspamd
}
