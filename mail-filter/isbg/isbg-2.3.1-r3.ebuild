# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1

DESCRIPTION="scan an IMAP inbox for spam using SpamAssassin"
HOMEPAGE="https://gitlab.com/isbg/isbg/"
RESTRICT="mirror"
SRC_URI="https://gitlab.com/${PN}/${PN}/-/archive/${PV}/${PN}-${PV}.tar.bz2"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/docopt
"
src_install() {
	distutils-r1_src_install
}
