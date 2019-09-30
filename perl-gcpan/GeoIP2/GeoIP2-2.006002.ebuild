# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="MAXMIND"
MODULE_VERSION="2.006002"

inherit perl-module

DESCRIPTION="Perl API for GeoIP2 databases"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Test-Fatal
	dev-perl/List-SomeUtils
	>=perl-gcpan/MaxMind-DB-Reader-1.000014
	dev-perl/Test-Number-Delta
	dev-perl/libwww-perl
	dev-perl/JSON-MaybeXS
	dev-perl/Sub-Quote
	dev-perl/Throwable
	dev-perl/Params-Validate
	dev-perl/Try-Tiny
	dev-perl/Moo
	dev-perl/HTTP-Message
	>=dev-perl/Data-Validate-IP-0.270.0
	dev-perl/URI
	dev-perl/LWP-Protocol-https
	perl-gcpan/MaxMind-DB-Common
	dev-perl/namespace-clean
	dev-perl/Path-Class
	dev-lang/perl"
