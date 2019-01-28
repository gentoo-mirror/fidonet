# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="MBRADSHAW"
MODULE_VERSION="2.20181212"

inherit perl-module

DESCRIPTION="A Perl Mail Authentication Milter"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Mail-DKIM
	perl-gcpan/Mail-AuthenticationResults
	dev-perl/Email-Date-Format
	dev-perl/Crypt-OpenSSL-RSA
	dev-perl/Mail-DMARC
	perl-gcpan/Prometheus-Tiny-Shared
	dev-perl/Email-Simple
	dev-perl/Test-Exception
	dev-perl/Clone
	dev-perl/Net-DNS-Resolver-Mock
	dev-perl/Net-DNS
	perl-gcpan/TOML
	dev-perl/Net-IP
	dev-perl/List-MoreUtils
	dev-perl/Net-Server
	dev-perl/JSON
	dev-perl/File-ShareDir-Install
	dev-perl/Test-File-Contents
	dev-perl/Proc-ProcessTable
	dev-perl/Mail-SPF
	dev-lang/perl"
