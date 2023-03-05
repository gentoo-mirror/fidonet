# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DESCRIPTION="Virtual for optional spamassassin perl modules"
SLOT="0"
KEYWORDS="amd64 arm arm64 ppc ppc64 ~riscv sparc x86"
IUSE=""

# GeoIP2::Database::Reader ('require' failed)
# Razor2::Client::Agent ('require' failed)
# IO::Socket::SSL ('require' failed)
# LWP::UserAgent ('require' failed)
# Archive::Zip ('require' failed)
# IO::String ('require' failed)

RDEPEND="dev-perl/IO-Socket-SSL
dev-perl/LWP-UserAgent-Determined
dev-perl/Archive-Zip
dev-perl/IO-String
"
