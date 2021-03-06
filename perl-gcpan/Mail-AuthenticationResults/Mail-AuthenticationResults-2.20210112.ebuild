# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="MBRADSHAW"
MODULE_VERSION="2.20210112"

inherit perl-module

DESCRIPTION="Class modelling Sub Entry parts of the Authentication Results Header"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/JSON
	dev-perl/Test-Exception
	dev-lang/perl"
