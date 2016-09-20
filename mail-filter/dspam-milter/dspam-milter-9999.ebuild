# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 python-r1 user eutils git-r3

DESCRIPTION="dspam milter"
SRC_URI=""
EGIT_REPO_URI="git://github.com/whyscream/dspam-milter.git"
HOMEPAGE="https://github.com/whyscream/dspam-milter"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="=dev-python/pymilter-0.9.3
	dev-python/setuptools"

src_unpack() {
	git-r3_src_unpack
}

python_install_all() {
	distutils-r1_python_install_all
}

#pkg_setup() {
#	enewgroup dspam
#	enewuser dspam -1 -1 /var/lib/dspam dspam
#}
