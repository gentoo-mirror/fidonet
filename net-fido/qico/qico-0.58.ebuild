# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

WANT_AUTOMAKE="1.13.4"

inherit libtool autotools eutils toolchain-funcs

DESCRIPTION="Qico is an FidoNet Technology Network (FTN) mailer"
SRC_URI="mirror://sourceforge/qico/${P}.tar.bz2"
HOMEPAGE="http://sourceforge.net/projects/qico"

IUSE=""
SLOT="0"
LICENSE="BSD"
KEYWORDS="~x86 ~amd64"

DEPEND="sys-libs/ncurses:0 net-dialup/mgetty =sys-devel/automake-1.9.6-r4"
RDEPEND="sys-libs/ncurses:0 net-dialup/mgetty"

src_unpack() {
	unpack ${A}
}

src_prepare() {
	eautoreconf || die
}

src_compile() {
	emake -f Makefile CC="$(tc-getCC)" LDFLAGS="" || die
}

src_configure() {
	econf || die
}

#src_install() {
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
