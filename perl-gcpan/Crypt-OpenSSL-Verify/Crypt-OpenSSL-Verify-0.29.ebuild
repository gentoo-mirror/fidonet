# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="TIMLEGGE"
MODULE_VERSION="0.29"

inherit perl-module

DESCRIPTION="OpenSSL Verify certificate verification in XS."

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Test-Exception
	dev-perl/File-Slurp
	>=perl-gcpan/Crypt-OpenSSL-X509-1.908
	dev-lang/perl"
