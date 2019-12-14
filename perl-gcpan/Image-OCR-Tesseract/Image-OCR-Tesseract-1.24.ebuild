# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="LEOCHARRE"
MODULE_VERSION="1.24"

inherit perl-module

DESCRIPTION="read an image with tesseract ocr and get output"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# >=perl-gcpan/LEOCHARRE-CLI-1.19
DEPEND="dev-perl/String-ShellQuote
	>=dev-perl/File-Find-Rule-0.340.0
	>=dev-perl/File-Which-1.220.0
	dev-lang/perl"
