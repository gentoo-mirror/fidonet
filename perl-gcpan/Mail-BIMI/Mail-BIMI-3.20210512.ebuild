# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="MBRADSHAW"
MODULE_VERSION="3.20210512"

inherit perl-module

DESCRIPTION="BIMI object"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Mozilla-CA
	dev-perl/Moose
	dev-perl/Pod-Weaver
	dev-perl/Pod-Elemental
	perl-gcpan/Mail-AuthenticationResults
	dev-perl/Test-Differences
	dev-perl/Convert-ASN1
	dev-perl/Class-Load
	dev-perl/Try-Tiny
	dev-perl/Net-DNS
	dev-perl/Test-Exception
	dev-perl/Test-Class
	dev-perl/JSON
	>=perl-gcpan/Crypt-OpenSSL-Verify-0.28
	dev-perl/Test-RequiresInternet
	dev-perl/File-Slurp
	dev-perl/App-Cmd
	perl-gcpan/HTTP-Tiny-Paranoid
	dev-perl/Mail-DMARC
	>=perl-gcpan/Crypt-OpenSSL-X509-1.908
	dev-perl/Sub-Install
	dev-perl/Capture-Tiny
	>=dev-perl/XML-LibXML-2.13.200
	dev-perl/Mail-SPF
	>=dev-perl/Net-DNS-Resolver-Mock-1.201.710.310
	dev-perl/Moo
	dev-perl/Import-Into
	dev-perl/Sereal
	dev-perl/Cache-FastMmap
	dev-lang/perl"
