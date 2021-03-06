# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 python3_9 )

inherit distutils-r1

DESCRIPTION="verification library"
HOMEPAGE="https://launchpad.net/dkimpy"
# SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
SRC_URI="http://distfiles.overlay.junc.org/fidonet/dmarc-1.0.2-py3-none-any.whl"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""
