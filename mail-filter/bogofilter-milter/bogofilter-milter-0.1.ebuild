# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils user

DESCRIPTION="bogofilter milter"
HOMEPAGE="https://stuff.mit.edu/~jik/software/bogofilter-milter/bogofilter-milter.pl.txt"
SRC_URI="https://stuff.mit.edu/~jik/software/bogofilter-milter/bogofilter-milter.pl.txt"
LICENSE="BSD-2 Sendmail"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	virtual/perl-DB_File
	virtual/perl-Data-Dumper
	virtual/perl-File-Temp
	virtual/perl-Getopt-Long
	dev-perl/IO-stringy
	perl-gcpan/Mail-Alias
	dev-perl/Net-CIDR
	dev-perl/Net-DNS
	dev-perl/Proc-Daemon
	perl-gcpan/Sendmail-Milter
	virtual/perl-Sys-Syslog
"

pkg_setup() {
	enewgroup milter
	enewuser milter -1 -1 /dev/null milter
}

src_install() {
	newinitd "${FILESDIR}"/bogofilter-milter.initd bogofilter-milter
	newconfd "${FILESDIR}"/bogofilter-milter.confd bogofilter-milter
}
