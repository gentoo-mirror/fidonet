# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MODULE_AUTHOR="KARUPA"
MODULE_VERSION="0.01"

inherit perl-module

DESCRIPTION="fuzzy number comparison with Test::Deep"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Module-Build
	dev-perl/Math-Round
	dev-perl/Module-Build-Tiny
	dev-perl/Test-Deep
	dev-lang/perl"
