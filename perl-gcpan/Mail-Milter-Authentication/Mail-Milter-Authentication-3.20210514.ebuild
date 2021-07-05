# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="MBRADSHAW"
MODULE_VERSION="3.20210514"

inherit perl-module

DESCRIPTION="A Perl Mail Authentication Milter"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Mail-DKIM
	perl-gcpan/Lock-File
	dev-perl/List-MoreUtils
	>=perl-gcpan/Prometheus-Tiny-Shared-0.023
	dev-perl/TimeDate
	dev-perl/File-Slurp
	dev-perl/Test-Perl-Critic
	dev-perl/Text-Table
	dev-perl/Mail-AuthenticationResults
	dev-perl/Net-DNS
	dev-perl/Net-IP
	dev-perl/Net-Server
	dev-perl/Import-Into
	perl-gcpan/TOML
	dev-perl/Mail-SPF
	dev-perl/Test-File-Contents
	>=perl-gcpan/Mail-DataFeed-Abusix-2.20210112
	>=dev-perl/Mail-DMARC-1.202.104.270
	dev-perl/Clone
	dev-perl/Log-Dispatchouli
	dev-perl/Test-Exception
	dev-perl/JSON-XS
	dev-perl/Email-Date-Format
	dev-perl/Crypt-OpenSSL-RSA
	dev-perl/Sereal
	>=dev-perl/Net-DNS-Resolver-Mock-1.201.710.310
	dev-perl/App-Cmd
	dev-perl/SUPER
	dev-perl/Email-Sender
	>=perl-gcpan/Mail-BIMI-3.20210512
	dev-perl/Date-Manip
	dev-perl/Proc-ProcessTable
	>=dev-perl/File-ShareDir-Install-0.110.0
	dev-perl/Email-Simple
	dev-lang/perl"
