# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils autotools-utils user

DESCRIPTION="Open source DMARC implementation"
HOMEPAGE="http://sourceforge.net/projects/opendmarc/"
SRC_URI="mirror://sourceforge/project/opendmarc/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="mysql +minimal +spf"

CDEPEND="|| ( mail-filter/libmilter mail-mta/sendmail )
	mysql? ( dev-db/opendbx[mysql=] )"

RDEPEND="${CDEPEND}
	sys-process/psmisc
	!minimal? ( dev-perl/DBI
		mysql? ( dev-perl/DBD-mysql )
	)"

DEPEND="${CDEPEND}"

DOCS=( INSTALL README RELEASE_NOTES )

pkg_setup() {
	enewgroup milter
	enewuser milter -1 -1 /var/lib/milter milter
}

src_prepare() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${PN}-quarantinepolicy.patch
}

src_configure() {
	local sqlbackend="--with-sql-backend=none"
	if use mysql; then
		sqlbackend=" --with-sql-backend=mysql "
	fi
	if use spf; then
		spf=" --with-spf "
	fi
	local myeconfargs=(
		${sqlbackend}
		${spf}
		--with-milter
	)
	autotools-utils_src_configure
}

src_install() {
	autotools-utils_src_install
	prune_libtool_files --all
	newinitd "${FILESDIR}"/opendmarc.init opendmarc
	insinto /etc/opendmarc
	newins	"${D}"/usr/share/doc/${P}/opendmarc.conf.sample opendmarc.conf
}
