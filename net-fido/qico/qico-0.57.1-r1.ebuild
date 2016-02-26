# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils toolchain-funcs

DESCRIPTION="Qico is an FidoNet Technology Network (FTN) mailer"
SRC_URI="http://distfiles.overlay.junc.org/fidonet/${P}xe.tar.bz2"
HOMEPAGE="http://sourceforge.net/projects/qico"

IUSE=""
SLOT="0"
LICENSE="BSD"
KEYWORDS="~x86 ~amd64"
RESTRICT="mirror"
DEPEND="sys-libs/ncurses:0 net-dialup/mgetty"
RDEPEND="sys-libs/ncurses:0 net-dialup/mgetty"

S="${WORKDIR}/qico-0.57.1xe"

pkg_setup() {
	enewgroup fidonet || die
	enewuser fidonet -1 /bin/bash /var/spool/fidonet/ fidonet || die
	usermod -G uucp fidonet || die
}

src_unpack() {
	unpack ${A}
}

src_compile() {
	emake -f Makefile CC="$(tc-getCC)" LDFLAGS="" || die
}

src_configure() {
	econf --with-config=/etc/fidonet/qico.conf --enable-hydra8k --disable-perl --disable-debug || die
}

src_install() {
	dosbin src/qico
	dobin src/{qcc,qctl}
	dodoc ChangeLog Changes README FAQ qico.conf.sample qico.passwd.sample qico.substs.sample
	doman man/{qcc.8,qctl.8,qico.8}
	insinto /etc/fidonet
	newins qico.conf.sample qico.conf
	exeinto /etc/init.d
	newexe stuff/ftn ftn
	diropts -o fidonet -g fidonet
	dodir /var/run/fidonet /var/log/fidonet /var/spool/fidonet
}
