# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils cvs

DESCRIPTION="HUSKY Portable Fidosoft Project - hpt"
HOMEPAGE="http://husky.sf.net"
ECVS_AUTH="pserver"
ECVS_SERVER="husky.cvs.sourceforge.net:/cvsroot/husky"
ECVS_BRANCH=""
ECVS_MODULE="huskybse hpt"
ECVS_CVS_COMPRESS="-z3"
ECVS_LOCALNAME="husky-1_9-stable"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="perl -doc -debug"

DEPEND="!net-fido/husky
	=net-fido/smapi-2.4
	=net-fido/fidoconf-1.9
	perl? ( dev-lang/perl )
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
	
	use perl && sed -e 's:PERL=0:PERL=1:' -i huskymak.cfg
	use debug && sed -e 's:DEBUG=0:DEBUG=1:' -i huskymak.cfg
}

src_compile() {
	DESTDIR="${DESTDIR_COMPILE}"
	
	cd "${S}/hpt"
	emake PREFIX=${DESTDIR}usr CFGDIR=${DESTDIR}etc/ftn \
		MANDIR=${DESTDIR}usr/share/man || die "emake failed"
	if use doc ; then
		cd doc
		emake INFODIR=${DESTDIR}usr/share/info \
			HTMLDIR=${DESTDIR}usr/share/doc/husky-${PV}/html \
			html info || die "emake failed [docs]"
		cd ..
	fi
}

src_install() {
	DESTDIR="${DESTDIR_INSTALL}"
	
	cd "${S}/hpt"
	dodir /usr/bin
	MAKEOPTS="-j1" emake \
		PREFIX=${DESTDIR}usr CFGDIR=${DESTDIR}etc/ftn \
		MANDIR=${DESTDIR}usr/share/man -j1 \
		install || die "emake install failed"
	use doc && doinfo doc/*.info
	use doc && insinto /usr/share/doc/husky-${PV}/html
	use doc && doins doc/*.html
	insinto /etc/ftn
	doins config/config config/areas config/fileareas config/links config/packer config/path
}
