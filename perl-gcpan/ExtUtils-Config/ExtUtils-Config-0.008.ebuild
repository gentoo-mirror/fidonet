# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="LEONT"
MODULE_VERSION="0.008"

inherit perl-module

DESCRIPTION="A wrapper for perl's configuration"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/perl"

pkg_postinst() {
elog "If you redistribute this package, please remember to"
elog "update /etc/portage/categories with an entry for perl-gpcan"
}
