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

DEPEND="dev-perl/Proc-ProcessTable
	perl-gcpan/Mail-AuthenticationResults
	>=dev-perl/File-ShareDir-Install-0.110.0
	dev-perl/Sereal
	dev-perl/Crypt-OpenSSL-RSA
	dev-perl/Email-Simple
	dev-perl/List-MoreUtils
	dev-perl/Net-DNS
	dev-perl/Net-Server
	dev-perl/Test-File-Contents
	dev-perl/Mail-DKIM
	dev-perl/Log-Dispatchouli
	>=dev-perl/Net-DNS-Resolver-Mock-1.201.710.310
	dev-perl/Import-Into
	>=dev-perl/Mail-DMARC-1.201.709.110
	>=perl-gcpan/Mail-DataFeed-Abusix-2.20210112
	dev-perl/Email-Sender
	dev-perl/App-Cmd
	dev-perl/Clone
	dev-perl/Mail-SPF
	dev-perl/Text-Table
	dev-perl/JSON-XS
	perl-gcpan/Lock-File
	dev-perl/File-Slurp
	dev-perl/Test-Exception
	dev-perl/Date-Manip
	>=perl-gcpan/Mail-BIMI-3.20210512
	>=perl-gcpan/Prometheus-Tiny-Shared-0.021
	dev-perl/TimeDate
	dev-perl/SUPER
	dev-perl/Email-Date-Format
	dev-perl/Net-IP
	dev-perl/Test-Perl-Critic
	dev-lang/perl"
