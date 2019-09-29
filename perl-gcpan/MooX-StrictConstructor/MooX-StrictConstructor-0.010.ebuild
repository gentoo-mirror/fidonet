# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MODULE_AUTHOR="HARTZELL"
MODULE_VERSION="0.010"

inherit perl-module

DESCRIPTION="Make your Moo-based object constructors blow up on unknown attributes."

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Moo
	dev-perl/Test-Fatal
	dev-perl/strictures
	dev-perl/Class-Method-Modifiers
	dev-lang/perl"
