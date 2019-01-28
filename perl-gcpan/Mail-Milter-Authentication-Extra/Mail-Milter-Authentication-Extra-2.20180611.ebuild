# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="MBRADSHAW"
MODULE_VERSION="2.20180611"

inherit perl-module

DESCRIPTION="Extra handlers for Authentication Milter"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="perl-gcpan/Mail-Milter-Authentication
	perl-gcpan/Mail-AuthenticationResults
	perl-gcpan/ClamAV-Client
	dev-perl/Test-MockModule
	dev-perl/Net-DNS-Resolver-Mock
	dev-perl/JSON
	dev-perl/Test-File-Contents
	dev-lang/perl"
