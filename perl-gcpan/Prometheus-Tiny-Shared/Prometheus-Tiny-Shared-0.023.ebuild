# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="ROBN"
MODULE_VERSION="0.023"

inherit perl-module

DESCRIPTION="A tiny Prometheus client with a shared database behind it"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Data-Random
	perl-gcpan/Hash-SharedMem
	dev-perl/JSON-XS
	dev-perl/Test-Differences
	dev-perl/HTTP-Message
	>=perl-gcpan/Prometheus-Tiny-0.007
	dev-perl/Test-Exception
	dev-perl/Plack
	dev-lang/perl"
