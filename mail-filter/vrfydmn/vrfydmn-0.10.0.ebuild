# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_6 )

inherit distutils-r1 autotools eutils flag-o-matic user systemd git-r3

SRC_URI=""
EGIT_REPO_URI="https://github.com/croessner/vrfydmn.git"
DESCRIPTION="The package of Python milters that wraps the C libmilter library."
HOMEPAGE="https://github.com/croessner/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="mail-filter/libmilter dev-python/pymilter"
RDEPEND="${DEPEND}"

src_unpack() {
	git-r3_src_unpack
}
