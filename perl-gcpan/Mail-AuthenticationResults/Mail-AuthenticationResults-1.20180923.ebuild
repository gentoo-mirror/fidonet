# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="MBRADSHAW"
MODULE_VERSION="1.20180923"

inherit perl-module

DESCRIPTION="Object Oriented Authentication-Results Headers"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Test-Exception
	dev-lang/perl"
