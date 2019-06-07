# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MODULE_AUTHOR="NWELLNHOF"
MODULE_VERSION="3.03"

inherit perl-module

DESCRIPTION="Build an IP address to country code database"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="perl-gcpan/Math-Int64
	dev-lang/perl"
