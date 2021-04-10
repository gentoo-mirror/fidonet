# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="ZEFRAM"
MODULE_VERSION="0.005"

inherit perl-module

DESCRIPTION="efficient shared mutable hash"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-perl/Devel-CallChecker-0.8.0
	dev-perl/Module-Build
	perl-gcpan/Scalar-String
	dev-lang/perl"
