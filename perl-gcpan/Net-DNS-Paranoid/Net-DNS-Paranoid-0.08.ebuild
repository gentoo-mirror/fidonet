# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="TOKUHIROM"
MODULE_VERSION="0.08"

inherit perl-module

DESCRIPTION="paranoid dns resolver"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-perl/Class-Accessor-Lite-0.80.0
	>=dev-perl/Net-DNS-1.130.0
	>=dev-perl/Module-Build-0.422.400
	dev-lang/perl"
