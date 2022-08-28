# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_10 )

inherit distutils-r1

# Summary: Python bindings for the LZMA library by Igor Pavlov.
# Home-page: http://www.joachim-bauch.de/projects/pylzma/

DESCRIPTION="Python bindings for the LZMA library by Igor Pavlov"
HOMEPAGE="http://www.joachim-bauch.de/projects/pylzma/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
