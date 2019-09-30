# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="MBRADSHAW"
MODULE_VERSION="2.20190523"

inherit perl-module

DESCRIPTION="Load config files for Authentication Milter"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DEPEND="dev-perl/Test-Exception
	dev-perl/Mail-DKIM
	perl-gcpan/Mail-AuthenticationResults
	dev-perl/Log-Dispatchouli
	dev-perl/Net-IP
	>=dev-perl/File-ShareDir-Install-0.110.0
	dev-perl/Clone
	dev-perl/List-MoreUtils
	dev-perl/Email-Date-Format
	dev-perl/Email-Simple
	dev-perl/Net-Server
	dev-perl/Proc-ProcessTable
	perl-gcpan/TOML
	perl-gcpan/Prometheus-Tiny-Shared
	>=dev-perl/Mail-DMARC-1.201.709.110
	dev-perl/Net-DNS
	dev-perl/Test-File-Contents
	>=dev-perl/Net-DNS-Resolver-Mock-1.201.710.310
	dev-perl/Crypt-OpenSSL-RSA
	dev-perl/Mail-SPF
	dev-perl/JSON
	dev-lang/perl"
