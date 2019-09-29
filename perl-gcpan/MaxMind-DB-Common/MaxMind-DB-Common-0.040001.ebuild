# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MODULE_AUTHOR="MAXMIND"
MODULE_VERSION="0.040001"

inherit perl-module

DESCRIPTION="No description available"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Moo
	dev-perl/namespace-autoclean
	dev-perl/DateTime
	dev-perl/Data-Dumper-Concise
	dev-perl/Sub-Quote
	perl-gcpan/MooX-StrictConstructor
	dev-perl/List-AllUtils
	dev-lang/perl"
