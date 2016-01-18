# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit distutils-r1

SUPPORT_PYTHON_ABIS="1"
DISTUTILS_SRC_TEST="setup.py"
PYTHON_COMPAT=( python-2_7 )

DESCRIPTION="Mail hosting made simple"
HOMEPAGE="http://modoboa.org/"
SRC_URI="mirror://pypi/m/modoboa/${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~x86"
SLOT="0"
IUSE="doc"

DEPEND="dev-python/setuptools"
RDEPEND="!<net-www/django-1.7
	>=net-www/django-1.6
	dev-python/setuptools"


src_install() {
	distutils_src_install
	if use doc; then
		dodoc -r doc
	fi
}
