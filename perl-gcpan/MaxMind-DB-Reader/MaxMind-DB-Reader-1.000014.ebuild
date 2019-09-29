# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MODULE_AUTHOR="MAXMIND"
MODULE_VERSION="1.000014"

inherit perl-module

DESCRIPTION="Read MaxMind DB files and look up IP addresses"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/namespace-autoclean
	dev-perl/Moo
	>=dev-perl/Data-Validate-IP-0.270.0
	perl-gcpan/MaxMind-DB-Common
	perl-gcpan/MooX-StrictConstructor
	>=dev-perl/Path-Class-0.370.0
	dev-perl/Test-Requires
	dev-perl/DateTime
	perl-gcpan/Data-Printer
	dev-perl/Test-Fatal
	perl-gcpan/Data-IEEE754
	dev-perl/Test-Number-Delta
	dev-perl/Module-Implementation
	dev-perl/List-AllUtils
	dev-perl/Role-Tiny
	perl-gcpan/Test-Bits
	dev-lang/perl"
