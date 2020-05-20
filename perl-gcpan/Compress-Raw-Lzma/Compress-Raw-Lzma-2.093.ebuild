# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="PMQS"
MODULE_VERSION="2.093"

inherit perl-module

DESCRIPTION="Low-Level Interface to lzma compression library"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/perl"
