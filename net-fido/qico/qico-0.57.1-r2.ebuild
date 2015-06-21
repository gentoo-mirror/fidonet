# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# Date:   2009-05-21 08:55:08
# From:   Eugene V. Subbotin of 2:5075/35
# To:     Benny Pedersen
# Subj:   Re: qico
# Attr:   Rcv
# Conf:   CarbonArea - private echomails
#
#  * Forwarded from area 'LINUX'
# In fido.linux Benny Pedersen <Benny_Pedersen@f53.n237.z2.fidonet.org> wrote:
#
#  EVS>> FreeBSD ports is using version 0.57.1 in qico-xe package and 
#  EVS>> 0.49.10.3 in qico package.
#  BP> both stable under bsd ?,
#
# Yes :)
#
#  BP> next question where is the sources ?
#
# Master site for qico-xe is unavailable now, so you can download source package 
# from ftp://ftp.freebsd.org/pub/FreeBSD/distfiles/qico-0.57.1xe.tar.bz2
# qico branch is also available from 
# ftp://ftp.freebsd.org/pub/FreeBSD/distfiles/qico-0.49.10-p3.tar.bz2 or from 
# sourceforge.
#
# --- tin/1.9.0-20060228 ("Ardlussa") (UNIX) (FreeBSD/7.1-RELEASE (i386))
#  * Origin: FireFox Station, Togliatti, RU (2:5075/35)

EAPI=2

WANT_AUTOMAKE="1.9"

inherit libtool autotools eutils toolchain-funcs

DESCRIPTION="Qico is an FidoNet Technology Network (FTN) mailer"
#SRC_URI="ftp://ftp.freebsd.org/pub/FreeBSD/distfiles/${P}xe.tar.bz2" # http://andre.grueneberg.de/binkd/${P}xe-ipv6.diff"
SRC_URI="ftp://f0.n230.z2.binkp.net/pub/overlays/fidonet/${P}xe.tar.bz2"
HOMEPAGE="http://sourceforge.net/projects/qico"

#IUSE="ipv6"
IUSE=""
SLOT="0"
LICENSE="BSD"
KEYWORDS="~x86 ~amd64"
RESTRICT="mirror"
DEPEND="sys-libs/ncurses net-dialup/mgetty"
RDEPEND="sys-libs/ncurses net-dialup/mgetty"
S="${WORKDIR}/qico-${P}xe"

pkg_setup() {
	enewgroup fidonet || die
	enewuser fidonet -1 /bin/bash /var/spool/fidonet/ fidonet || die
	usermod -G uucp fidonet || die
}

src_unpack() {
	unpack ${A}
}

src_prepare() {
	# sed -i -e '/CFLAGS+=/d' Makefile || die
	# sed -i -e '/LDFLAGS+=/d' Makefile || die
	epatch "${FILESDIR}"/${P}xe-ipv6.patch
	eautoreconf || die
}

src_compile() {
	emake -f Makefile CC="$(tc-getCC)" LDFLAGS="" || die
}

src_configure() {
	# econf --with-config=/etc/fidonet/qico.conf --enable-hydra8k --disable-perl --disable-debug || die
	econf || die
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
