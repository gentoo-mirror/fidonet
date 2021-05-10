# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="ROBN"
MODULE_VERSION="0.021"

inherit perl-module

DESCRIPTION="A tiny Prometheus client with a shared database behind it"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Plack
	dev-perl/HTTP-Message
	dev-perl/Test-Exception
	dev-perl/Data-Random
	perl-gcpan/Hash-SharedMem
	dev-perl/JSON-XS
	dev-perl/Test-Differences
	>=perl-gcpan/Prometheus-Tiny-0.006
	dev-lang/perl"
