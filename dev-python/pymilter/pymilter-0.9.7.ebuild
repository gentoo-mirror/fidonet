# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )

inherit distutils-r1

SRC_URI="http://downloads.sourceforge.net/project/${PN}/${PN}/${P}/${P}.tar.gz"

DESCRIPTION="The package of Python milters that wraps the C libmilter library."
HOMEPAGE="http://spidey2.bmsi.com/pymilter/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="mail-filter/libmilter"
RDEPEND="${DEPEND}"
