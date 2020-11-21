# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="KMCGRAIL"
MODULE_VERSION="2.5.0"

MODULE_SECTION="validMX"

inherit perl-module

DESCRIPTION="use DNS and/or regular expressions to verify if an email address could be valid."

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-perl/Net-DNS-1.130.0
	dev-lang/perl"
