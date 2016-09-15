# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils user eutils git-r3

DESCRIPTION="Another sendmail milter for different mail checks"
SRC_URI=""
EGIT_REPO_URI="git://github.com/vstakhov/rmilter.git"
HOMEPAGE="https://github.com/vstakhov/rmilter"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dkim memcached"

DEPEND="dev-libs/libpcre
	mail-filter/libmilter
	dkim? ( mail-filter/opendkim )
	memcached? ( dev-libs/libmemcached )"
RDEPEND="${DEPEND}"

src_unpack() {
	git-r3_src_unpack
}

pkg_setup() {
	enewgroup rmilter
	enewuser rmilter -1 -1 /var/run/rmilter rmilter
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_DKIM=$(usex dkim ON OFF)
		-DENABLE_MEMCACHED=$(usex memcached ON OFF)
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	newinitd "${FILESDIR}/rmilter.initd" rmilter
	newconfd "${FILESDIR}/rmilter.confd" rmilter
	insinto /etc/rmilter
	newins rmilter.conf.sample rmilter.conf.sample
	newins rmilter-grey.conf rmilter-grey.conf
}
