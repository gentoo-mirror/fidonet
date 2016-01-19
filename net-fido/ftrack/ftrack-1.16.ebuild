# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils autotools-utils

DESCRIPTION="FIDO FTN Tracker"
HOMEPAGE="http://ftrack-as.sourceforge.net"
SRC_URI="ftp://fidonet.overlay.junc.org/pub/overlays/fidonet/ftrack-1.16.tar.lzma"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""
WANT_AUTOMAKE="1.9"

src_unpack() {
	unpack ${A}
	cd "${S}"
}
src_prepare() {
	epatch "${FILESDIR}/${PV}-ftrack.patch"
}
src_configure() {
	autotools-utils_src_prepare
	autotools-utils_src_configure
}
src_compile() {
	emake
}
src_install() {
	dobin src/rntrack
	doman doc/rntrack.1
	dodoc doc/FAQ doc/MANUAL samples/tpl/audit.tpl samples/tpl/badfrom.tpl samples/tpl/badto.tpl samples/tpl/loop.tpl
}
