# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

# inherit libtool autotools autotools-utils eutils toolchain-funcs user
inherit user toolchain-funcs

DESCRIPTION="spf milter"

SRC_URI="http://distfiles.overlay.junc.org/fidonet/smf-spf-2.0.2.tar.bz2"
HOMEPAGE="http://smfs.sourceforge.net"

IUSE=""
SLOT="0"
LICENSE="BSD"
KEYWORDS="~x86 ~amd64"
RESTRICT="mirror"
DEPEND=""
RDEPEND=""

pkg_setup() {
	enewgroup smfs || die
	enewuser smfs -1 -1 /var/spool/smfs/ smfs || die
	usermod -G smfs smfs || die
}

src_unpack() {
	unpack ${A}
}

src_prepare() {
	epatch "${FILESDIR}"/01-fixwarnings.patch
	epatch "${FILESDIR}"/02-ar-header.patch
	epatch "${FILESDIR}"/03-no_daemon.patch
	epatch "${FILESDIR}"/04-logging.patch
	epatch "${FILESDIR}"/05-insert_header.patch
	epatch "${FILESDIR}"/06-ipv6.patch
	cp "${FILESDIR}"/gentoo-makefile "${S}/Makefile"
}

src_compile() {
	emake -f Makefile CC="$(tc-getCC)" LDFLAGS="-lmilter -lpthread -L/usr/lib -lspf2" || die
}

src_install() {
	dosbin smf-spf
	insinto /etc/opendmarc
}


# CDEPEND="|| ( mail-filter/libmilter mail-mta/sendmail )
# 	mysql? ( dev-db/opendbx[mysql=] )"

#RDEPEND="${CDEPEND}
#	sys-process/psmisc
#	!minimal? ( dev-perl/DBI
#		mysql? ( dev-perl/DBD-mysql )
#	)"

#	newinitd "${FILESDIR}"/opendmarc.init opendmarc
#	insinto /etc/opendmarc
#	newins	"${D}"/usr/share/doc/${P}/opendmarc.conf.sample opendmarc.conf
#}


# src_install() {
#	dosbin src/qico
#	dobin src/{qcc,qctl}
#	dodoc ChangeLog Changes README FAQ qico.conf.sample qico.passwd.sample qico.substs.sample
#	doman man/{qcc.8,qctl.8,qico.8}
#	insinto /etc/fidonet
#	newins qico.conf.sample qico.conf
#	exeinto /etc/init.d
#	newexe stuff/ftn ftn
#	diropts -o fidonet -g fidonet
#	dodir /var/run/fidonet /var/log/fidonet /var/spool/fidonet
#}
