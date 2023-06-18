# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# This ebuild generated by g-cpan 0.17.0

EAPI=8

DIST_AUTHOR="KARUPA"
DIST_VERSION="0.01"

inherit perl-module

DESCRIPTION="fuzzy number comparison with Test::Deep"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-perl/Module-Build
	dev-perl/Test-Deep
	>=dev-perl/Module-Build-Tiny-0.39.0
	dev-perl/Math-Round
	dev-lang/perl"
