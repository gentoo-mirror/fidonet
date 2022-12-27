# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Virtual for optional spamassassin perl modules"

SLOT="1"
KEYWORDS="amd64 arm arm64 ppc ppc64 ~riscv sparc x86 ~x86-linux"
IUSE=""

# older spamassassin
#
# GeoIP2::Database::Reader ('require' failed)
# Razor2::Client::Agent ('require' failed)
# IO::Socket::SSL ('require' failed)
# LWP::UserAgent ('require' failed)
# Archive::Zip ('require' failed)
# IO::String ('require' failed)
#
# spamassassin 4.x.x
#
# =dev-perl/Data-IEEE754-0.20.0 ~amd64
# =dev-perl/Data-Printer-1.0.4 ~amd64
# =dev-perl/IP-Country-2.28 ~amd64
# =dev-perl/IP-Country-DB_File-3.03-r1 ~amd64
# =dev-perl/MaxMind-DB-Common-0.40.1 ~amd64
# =dev-perl/MaxMind-DB-Reader-1.0.14 ~amd64
# =dev-perl/MaxMind-DB-Reader-XS-1.0.9 ~amd64
# =dev-perl/MooX-StrictConstructor-0.11.0 ~amd64

RDEPEND="dev-perl/Data-IEEE754
dev-perl/Data-Printer
dev-perl/IP-Country
dev-perl/IP-Country-DB_File
dev-perl/MaxMind-DB-Common
dev-perl/MaxMind-DB-Reader
dev-perl/MaxMind-DB-Reader-XS
dev-perl/MooX-StrictConstructor
"
