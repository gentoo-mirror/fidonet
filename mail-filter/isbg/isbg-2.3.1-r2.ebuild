# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_10 )

inherit distutils-r1

DESCRIPTION="scan an IMAP inbox for spam using SpamAssassin"
HOMEPAGE="https://gitlab.com/isbg/isbg/"
RESTRICT="mirror"
SRC_URI="https://gitlab.com/${PN}/${PN}/-/archive/${PV}/${PN}-${PV}.tar.bz2 -> ${P}.tar.bz2"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/docopt
"
src_install() {
	distutils-r1_src_install
}
