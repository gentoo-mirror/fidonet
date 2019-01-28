# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="KARUPA"
MODULE_VERSION="0.91"

inherit perl-module

DESCRIPTION="simple toml parser"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Types-Serialiser
	dev-perl/Test-Deep
	perl-gcpan/Test-Deep-Fuzzy
	dev-perl/Module-Build-Tiny
	dev-perl/Module-Build
	dev-lang/perl"
