# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils cvs

DESCRIPTION="HUSKY Portable Fidosoft Project - bsopack"
HOMEPAGE="http://husky.sf.net"
ECVS_AUTH="pserver"
ECVS_SERVER="husky.cvs.sourceforge.net:/cvsroot/husky"
ECVS_BRANCH="husky-1_4-stable"
ECVS_MODULE="huskybse bsopack"
ECVS_CVS_COMPRESS="-z3"
ECVS_LOCALNAME="husky-1_4-stable"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="-doc -debug"

DEPEND="!net-ftn/husky
	=net-ftn/smapi-2.4
	=net-ftn/fidoconf-1.4
	doc? ( sys-apps/texinfo )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${ECVS_LOCALNAME}"

DESTDIR_COMPILE="/"
DESTDIR_INSTALL="${D}"

src_unpack() {
	cvs_src_unpack
}

src_prepare() {
	cd "${S}"
	cp ./huskybse/huskymak.cfg ./
	
	# prevent to strip while linking
	sed -e 's:OPTLFLAGS=-s:OPTLFLAGS=:' -i huskymak.cfg
	
	# prevent to strip while installing
	sed -e 's:OPTIBOPT=-c -s -m 555:OPTIBOPT=-c -m 555:' -i huskymak.cfg
	
	use debug && sed -e 's:DEBUG=0:DEBUG=1:' -i huskymak.cfg
}

src_compile() {
	DESTDIR="${DESTDIR_COMPILE}"
	
	cd "${S}/bsopack"
	emake PREFIX=${DESTDIR}usr \
		CFGDIR=${DESTDIR}etc/ftn \
		MANDIR=${DESTDIR}usr/share/man \
		|| die "emake failed"
	if use doc ; then
		emake info html || die "emake failed [docs]"
	fi
}

src_install() {
	DESTDIR="${DESTDIR_INSTALL}"
	
	cd "${S}/bsopack"
	dobin bsopack
	doman man/bsopack.1
	if use doc ; then
		doinfo bsopack.info
		insinto usr/share/doc/husky-${PV}/html
		doins bsopack.html
	fi
}
