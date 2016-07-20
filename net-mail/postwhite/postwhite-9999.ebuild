# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="Postwhite whitelist script based on spf"
SRC_URI=""
EGIT_REPO_URI="git://github.com/stevejenkins/postwhite.git"
HOMEPAGE="https://github.com/stevejenkins/postwhite.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="net-mail/spf-tools"

src_unpack() {
	git-r3_src_unpack
}
