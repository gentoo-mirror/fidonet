# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MODULE_AUTHOR="JMEHNLE"
MODULE_VERSION="0.11"

MODULE_SECTION="clamav-client"

inherit perl-module

DESCRIPTION="A client class for the ClamAV C<clamd> virus scanner daemon"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Module-Build
	dev-perl/Error
	dev-lang/perl"
