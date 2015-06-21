# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils cvs

DESCRIPTION="HUSKY Portable Fidosoft Project - msged"
HOMEPAGE="http://husky.sf.net"
ECVS_AUTH="pserver"
ECVS_SERVER="husky.cvs.sourceforge.net:/cvsroot/husky"
ECVS_BRANCH="husky-1_4-stable"
ECVS_MODULE="huskybse msged"
ECVS_CVS_COMPRESS="-z3"
ECVS_LOCALNAME="husky-1_4-stable"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="-doc -debug"

DEPEND="!net-ftn/husky
	=net-ftn/smapi-2.4
	=net-ftn/fidoconf-1.4
	doc? ( sys-apps/texinfo )
	sys-libs/ncurses"
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
	
	cd "${S}/msged"
	MAKEOPTS="${MAKEOPTS} -j1" emake -j1 \
		PREFIX=${DESTDIR}usr \
		CFGDIR=${DESTDIR}etc/ftn \
		MANDIR=${DESTDIR}usr/share/man \
		msged testcons || die "emake failed"
	if use doc ; then
		cd doc/manual
		emake INFODIR=${DESTDIR}usr/share/info \
			HTMLDIR=${DESTDIR}usr/share/doc/husky-1.4/html \
			html info -f makefile.husky \
			|| die "emake failed [docs]"
		cd ../..
	fi
	./msged -hc msghelp.src msghelp.dat || die "build help failed"
}

src_install() {
	DESTDIR="${DESTDIR_INSTALL}"
	
	cd "${S}/msged"
	dobin msged testcons
	insinto /etc/ftn
	doins msghelp.src msghelp.dat
	newins doc/sample.cfg msged.cfg.sample
	newins doc/sample.tpl msged.tpl.sample
	doins doc/scheme.*
	insinto /etc/ftn/msged.maps
	doins bin/*
	if use doc ; then
		doinfo doc/manual/*.info
		insinto /usr/share/doc/husky-1.4/html
		doins doc/manual/*.html
	fi
}
