# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_3 python3_4 )

inherit distutils-r1

DESCRIPTION="Mail hosting made simple"
HOMEPAGE="http://modoboa.org/"
SRC_URI="mirror://pypi/m/modoboa/${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE="doc"

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/django
	dev-python/setuptools"

src_install() {
	distutils-r1_src_install
	if use doc; then
		dodoc -r doc
	fi
}
