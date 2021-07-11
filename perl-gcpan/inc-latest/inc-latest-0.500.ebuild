# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="DAGOLDEN"
MODULE_VERSION="0.500"

inherit perl-module

DESCRIPTION="use modules bundled in inc/ if they are newer than installed ones"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/perl"
