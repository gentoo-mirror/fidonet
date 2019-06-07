# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MODULE_AUTHOR="ROBN"
MODULE_VERSION="0.002"

inherit perl-module

DESCRIPTION="A tiny Prometheus client"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/HTTP-Message
	dev-perl/Plack
	dev-lang/perl"
