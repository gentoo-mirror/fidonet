# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

DESCRIPTION="SRIF filerequest server / indexer"
HOMEPAGE="http://sourceforge.net/p/ftnapps/mfreq/ci/master/tree/"
SRC_URI="ftp://fidonet.overlay.junc.org/pub/base/mfreq311.tgz"

LICENSE="EUPL-1.1"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND=""
RDEPEND=""

S=${WORKDIR}/mfreq-3.11

src_compile() {
		cd ${S}
		emake -f Makefile || die
}
src_install() {
		dodoc sample-cfg/index.cfg sample-cfg/list.cfg sample-cfg/srif.cfg
		dobin mfreq-index mfreq-list mfreq-srif
}
