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

DEPEND="dev-perl/Pod-Elemental
	dev-perl/Test-RequiresInternet
	dev-perl/Test-Class
	perl-gcpan/HTTP-Tiny-Paranoid
	>=perl-gcpan/Crypt-OpenSSL-Verify-0.29
	dev-perl/Moose
	dev-perl/Mail-AuthenticationResults
	dev-perl/Try-Tiny
	dev-perl/Cache-FastMmap
	dev-perl/Net-DNS
	dev-perl/Mail-DMARC
	dev-perl/Test-Exception
	>=dev-perl/XML-LibXML-2.13.200
	dev-perl/Mail-SPF
	>=dev-perl/Net-DNS-Resolver-Mock-1.201.710.310
	dev-perl/App-Cmd
	dev-perl/Sereal
	dev-perl/Import-Into
	dev-perl/Moo
	>=perl-gcpan/Crypt-OpenSSL-X509-1.908
	dev-perl/Test-Differences
	dev-perl/File-Slurp
	dev-perl/JSON
	dev-perl/Sub-Install
	dev-perl/Convert-ASN1
	dev-perl/Pod-Weaver
	dev-perl/Class-Load
	dev-perl/Mozilla-CA
	dev-perl/Capture-Tiny
	dev-lang/perl"
