# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_6 python3_7 python3_8 )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1

RESTRICT="mirror"
SRC_URI="http://distfiles.overlay.junc.org/fidonet/${PN}-${PV}.tar.gz -> ${P}.tar.gz"

# tarballed as pymilter-pymilter.... with breaks gentoo building
# SRC_URI="http://downloads.sourceforge.net/project/${PN}/${PN}/${P}/${P}.tar.gz"

DESCRIPTION="The package of Python milters that wraps the C libmilter library."
HOMEPAGE="http://spidey2.bmsi.com/pymilter/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="mail-filter/libmilter"
RDEPEND="${DEPEND}"
