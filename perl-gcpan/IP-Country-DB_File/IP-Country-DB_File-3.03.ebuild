# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DIST_AUTHOR="NWELLNHOF"
DIST_VERSION="3.03"

inherit perl-module

DESCRIPTION="IPv4 and IPv6 to country translation using DB_File"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Math-Int64
	dev-lang/perl"
