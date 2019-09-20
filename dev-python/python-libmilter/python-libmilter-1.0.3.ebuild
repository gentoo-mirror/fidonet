# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_6 python3_7 )

inherit distutils-r1 autotools eutils flag-o-matic user systemd git-r3

SRC_URI=""
EGIT_REPO_URI="https://github.com/crustymonkey/python-libmilter.git"
DESCRIPTION="A pure python implementation of libmilter"
HOMEPAGE="http://stuffivelearned.org/doku.php?id=programming:python:python-libmilter"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="mail-filter/libmilter"
RDEPEND="${DEPEND}"

src_unpack() {
	git-r3_src_unpack
}
