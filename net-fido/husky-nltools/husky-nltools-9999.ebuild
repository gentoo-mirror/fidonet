# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils gnuconfig cvs

HM=${PN#husky-}
ECVS_AUTH="pserver"
ECVS_SERVER="husky.cvs.sourceforge.net:/cvsroot/husky"
ECVS_MODULE="${HM}"
ECVS_CVS_COMPRESS="-z3"

DESCRIPTION="FTN husky ${HM} library"
SRC_URI=""
HOMEPAGE="http://husky.sf.net"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
DEPEND="net-fido/husky-huskylib
	net-fido/husky-fidoconf
	net-fido/husky-smapi
	net-fido/husky-hptzip"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${ECVS_LOCALNAME}"

src_compile() {
cd "${S}/${HM}"
emake RPM_BUILD_ROOT=1 || die "Sorry! Do can not compile"
}
src_install() {
cd "${S}/${HM}"
	dobin nlcrc nldiff nlupd ulc
	dodoc sample.cfg sample.lnx
}
