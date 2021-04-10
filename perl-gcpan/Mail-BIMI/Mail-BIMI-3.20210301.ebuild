# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="MBRADSHAW"
MODULE_VERSION="3.20210301"

inherit perl-module

DESCRIPTION="BIMI object"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Pod-Elemental
	dev-perl/Mail-DMARC
	perl-gcpan/Mail-AuthenticationResults
	>=perl-gcpan/Crypt-OpenSSL-X509-1.903
	dev-perl/Import-Into
	dev-perl/Pod-Weaver
	dev-perl/App-Cmd
	dev-perl/Moo
	>=dev-perl/XML-LibXML-2.13.200
	dev-perl/Class-Load
	dev-perl/Test-Exception
	dev-perl/Test-RequiresInternet
	dev-perl/Moose
	dev-perl/Sereal
	dev-perl/Mozilla-CA
	>=dev-perl/Net-DNS-Resolver-Mock-1.201.710.310
	dev-perl/File-Slurp
	dev-perl/Net-DNS
	dev-perl/Convert-ASN1
	dev-perl/Mail-SPF
	dev-perl/Test-Class
	dev-perl/Try-Tiny
	dev-perl/Cache-FastMmap
	dev-perl/Capture-Tiny
	perl-gcpan/HTTP-Tiny-Paranoid
	dev-perl/Sub-Install
	>=perl-gcpan/Crypt-OpenSSL-Verify-0.28
	dev-perl/JSON
	dev-perl/Test-Differences
	dev-lang/perl"
