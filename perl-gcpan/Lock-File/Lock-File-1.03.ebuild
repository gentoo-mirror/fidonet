# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="MMCLERIC"
MODULE_VERSION="1.03"

inherit perl-module

DESCRIPTION="file locker with an automatic out-of-scope unlocking mechanism"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Test-Class
	dev-perl/IPC-System-Simple
	dev-perl/Log-Any
	dev-perl/Test-Fatal
	dev-perl/Test-Warn
	dev-lang/perl"
