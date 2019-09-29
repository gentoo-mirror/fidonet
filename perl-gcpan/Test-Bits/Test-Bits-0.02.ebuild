# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MODULE_AUTHOR="DROLSKY"
MODULE_VERSION="0.02"

inherit perl-module

DESCRIPTION="Provides a bits_is() subroutine for testing binary data"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Test-Fatal
	dev-perl/List-AllUtils
	dev-lang/perl"
