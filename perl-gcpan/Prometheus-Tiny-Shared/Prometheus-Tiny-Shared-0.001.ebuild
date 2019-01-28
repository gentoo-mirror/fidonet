# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="ROBN"
MODULE_VERSION="0.001"

inherit perl-module

DESCRIPTION="Prometheus::Tiny - A tiny Prometheus client backed by a shared memory region"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Cache-FastMmap
	perl-gcpan/Prometheus-Tiny
	dev-lang/perl"
