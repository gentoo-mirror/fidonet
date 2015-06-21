# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils cvs

DESCRIPTION="HUSKY Portable Fidosoft Project - fidoconfig"
HOMEPAGE="http://husky.sf.net"
ECVS_AUTH="pserver"
ECVS_SERVER="husky.cvs.sourceforge.net:/cvsroot/husky"
ECVS_BRANCH=""
ECVS_MODULE="huskybse fidoconf"
ECVS_CVS_COMPRESS="-z3"
ECVS_LOCALNAME="husky-1_9-stable"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="-doc -debug"

DEPEND="!net-fido/husky
	=net-fido/smapi-2.4
	doc? ( sys-apps/texinfo )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${ECVS_LOCALNAME}"

DESTDIR_COMPILE="/"
DESTDIR_INSTALL="${D}"

src_unpack() {
	cvs_src_unpack
}
#src_prepare() {
#	cd "${S}"
#	cp ./huskybse/huskymak.cfg ./
#	# prevent to strip while linking
#	sed -e 's:OPTLFLAGS=-s:OPTLFLAGS=:' -i huskymak.cfg
#	# prevent to strip while installing
#	sed -e 's:OPTIBOPT=-c -s -m 555:OPTIBOPT=-c -m 555:' -i huskymak.cfg
#	# prevent to update dynamic lybrary cache
#	echo "LDCONFIG=" >> huskymak.cfg
#	use debug && sed -e 's:DEBUG=0:DEBUG=1:' -i huskymak.cfg
#	use doc || ( echo "all:" > ./fidoconf/doc/Makefile && echo "install:" >> ./fidoconf/doc/Makefile )
#}
#src_compile() {
#	DESTDIR="${DESTDIR_COMPILE}"
#	cd "${S}/fidoconf"
#	emake $( use doc && echo "INFODIR=${DESTDIR}usr/share/info HTMLDIR=${DESTDIR}usr/share/doc/huksy-${PV}/html" ) \
#		PREFIX=${DESTDIR}usr \
#		CFGDIR=${DESTDIR}etc/ftn \
#		MANDIR=${DESTDIR}usr/share/man || die "emake failed"
#}
#src_install() {
#	DESTDIR="${DESTDIR_INSTALL}"
#	cd "${S}/fidoconf"
#	emake $(use doc && echo "INFODIR=${DESTDIR}usr/share/info HTMLDIR=${DESTDIR}usr/share/doc/husky-${PV}/html") \
#		PREFIX=${DESTDIR}usr \
#		CFGDIR=${DESTDIR}etc/ftn \
#		MANDIR=${DESTDIR}usr/share/man \
#		install install-man || die "emake install failed"
#	insinto /etc/ftn
#	newins doc/config config.sample
#}
