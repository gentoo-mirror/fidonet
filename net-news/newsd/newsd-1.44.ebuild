# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils user

# MY_P=${PN}-${PV/_/}
DESCRIPTION="Simple NNTP news server"
# HOMEPAGE="http://www.easysw.com/~mike/newsd/index.php"
HOMEPAGE="http://www.google.com"
# SRC_URI="ftp://ftp.easysw.com/pub/newsd/test/${MY_P}-source.tar.bz2"
SRC_URI="https://telefisk.org/newsd-1.44-source.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="sys-apps/groff"
RDEPEND="sys-apps/groff"

# S="${WORKDIR}/${MY_P}"

pkg_setup() {
	enewgroup news || die
	enewuser news -1 /bin/bash /var/spool/news/ news || die
	# usermod -G uucp fidonet || die
}

src_unpack() {
	unpack ${A}
}

src_prepare() {
	# epatch "${FILESDIR}"/${P}xe-ipv6.patch
	eautoreconf || die
}

src_compile() {
	# emake -f Makefile CC="$(tc-getCC)" LDFLAGS="" || die
	emake || die
}

src_configure() {
	econf || die
}

# src_install() {
# 	dosbin src/qico
# 	dobin src/{qcc,qctl}
# 	dodoc ChangeLog Changes README FAQ qico.conf.sample qico.passwd.sample qico.substs.sample
# 	doman man/{qcc.8,qctl.8,qico.8}
# 	insinto /etc/fidonet
# 	newins qico.conf.sample qico.conf
# 	exeinto /etc/init.d
# 	newexe stuff/ftn ftn
# 	diropts -o fidonet -g fidonet
# 	dodir /var/run/fidonet /var/log/fidonet /var/spool/fidonet
# }

src_install() {
	dodoc ANNOUNCEMENT CHANGES README inn2newsd.sh doc/*
	doman newsd.conf.5 newsd.8
	dosbin newsd
	insinto /etc
	doins newsd.conf
	newinitd "${FILESDIR}"/newsd.init newsd
}
