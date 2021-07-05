# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="ROBN"
MODULE_VERSION="0.07"

inherit perl-module

DESCRIPTION="A safer HTTP::Tiny"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Class-Method-Modifiers
	perl-gcpan/Net-DNS-Paranoid
	dev-lang/perl"
