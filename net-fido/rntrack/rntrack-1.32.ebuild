# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils versionator

DESCRIPTION="A FTN Messages tracker"
SRC_URI="ftp://fidonet.overlay.junc.org/pub/overlays/fidonet/rntrack-1_32-src.tar.lzma"
HOMEPAGE="http://ftrack-as.sourceforge.net/"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="amd64 x86"
#IUSE="-perl -log_pid -syslog_log_format"
IUSE="perl"

#DEPEND="perl? ( dev-lang/perl )"
DEPEND="dev-lang/perl"
RDEPEND="${DEPEND}"

AT_M4DIR="MakeFiles"

S="${WORKDIR}/ftrack-as"

src_unpack() {
	unpack ${A}
}

src_prepare() {
	# prevent to strip while linking
	sed -e "s:-s -L:-L:" -i MakeFiles/linux/Makefile
}

src_compile() {
	cd MakeFiles/linux
	emake $( useq perl && echo "ENABLE_SCRIPTS=1" || echo "ENABLE_SCRIPTS=0" ) \
		$( useq log_pid && echo "ENABLE_LOG_PID=1" || echo "ENABLE_LOG_PID=0" ) \
		$( useq syslog_log_format && echo "ENABLE_SYSLOG_LOG_FORMAT=1" || echo "ENABLE_SYSLOG_LOG_FORMAT=0" ) \
		|| die "emake failed"
}

src_install () {
	dobin MakeFiles/linux/rntrack
	doman doc/rntrack.1
	dodoc doc/MANUAL* doc/FAQ*
	insinto /etc/ftn
	doins samples/rntrack.cfg
	dodir /etc/ftn/rntrack.samples
	insinto /etc/ftn/rntrack.samples
	doins samples/*
}
