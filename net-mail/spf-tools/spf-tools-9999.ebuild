# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="spf-tools writed in bash to make life more fun"
SRC_URI=""
EGIT_REPO_URI="git://github.com/jsarenik/spf-tools.git"
HOMEPAGE="https://github.com/jsarenik/spf-tools.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND=""

src_unpack() {
	git-r3_src_unpack
}
