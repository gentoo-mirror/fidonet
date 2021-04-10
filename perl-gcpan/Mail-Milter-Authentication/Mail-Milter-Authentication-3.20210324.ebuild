# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="MBRADSHAW"
MODULE_VERSION="3.20210324"

inherit perl-module

DESCRIPTION="A Perl Mail Authentication Milter"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=perl-gcpan/Mail-BIMI-3.20210301
	dev-perl/Mail-DKIM
	perl-gcpan/Mail-AuthenticationResults
	perl-gcpan/Lock-File
	dev-perl/Import-Into
	dev-perl/Test-File-Contents
	dev-perl/Net-DNS
	dev-perl/App-Cmd
	dev-perl/Test-Exception
	dev-perl/Clone
	dev-perl/Email-Date-Format
	dev-perl/Email-Sender
	>=dev-perl/Mail-DMARC-1.201.709.110
	dev-perl/Mail-SPF
	dev-perl/Proc-ProcessTable
	perl-gcpan/TOML
	dev-perl/SUPER
	dev-perl/Net-IP
	dev-perl/Date-Manip
	dev-perl/Log-Dispatchouli
	dev-perl/Email-Simple
	>=perl-gcpan/Mail-DataFeed-Abusix-2.20210112
	>=dev-perl/File-ShareDir-Install-0.110.0
	dev-perl/Net-Server
	dev-perl/Text-Table
	dev-perl/Test-Perl-Critic
	dev-perl/File-Slurp
	dev-perl/Sereal
	>=dev-perl/Net-DNS-Resolver-Mock-1.201.710.310
	dev-perl/List-MoreUtils
	dev-perl/Crypt-OpenSSL-RSA
	dev-perl/JSON-XS
	dev-perl/TimeDate
	>=perl-gcpan/Prometheus-Tiny-Shared-0.020
	dev-lang/perl"
