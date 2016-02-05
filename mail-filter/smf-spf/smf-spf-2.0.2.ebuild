# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit user toolchain-funcs eutils

DESCRIPTION="spf milter"

SRC_URI="http://distfiles.overlay.junc.org/fidonet/smf-spf-2.0.2.tar.bz2"
HOMEPAGE="http://smfs.sourceforge.net"

IUSE=""
SLOT="0"
LICENSE="BSD"
KEYWORDS="~x86 ~amd64"
RESTRICT="mirror"
DEPEND=""
RDEPEND="mail-filter/libmilter"

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
	dodir /etc/mail/smfs
	insinto /etc/mail/smfs
	newins	"${S}"/smf-spf.conf smf-spf.conf
}
