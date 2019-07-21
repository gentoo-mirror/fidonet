# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools eutils flag-o-matic user systemd git-r3

DESCRIPTION="OpenDNARC milter"
HOMEPAGE="https://github.com/trusteddomainproject/OpenDMARC"
SRC_URI=""
EGIT_REPO_URI="https://github.com/trusteddomainproject/OpenDMARC.git"
LICENSE="BSD-2 Sendmail"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~sparc-solaris ~x86-solaris"
IUSE=""

CDEPEND=""
DEPEND="${CDEPEND}
	=sys-devel/automake-1.14.1-r2
	virtual/pkgconfig"
RDEPEND="${CDEPEND}"

DOCS=( README )

src_unpack() {
	git-r3_src_unpack
}

pkg_setup() {
	enewgroup milter
	enewuser milter -1 -1 /dev/null milter
}

src_prepare() {
	default
	eautoreconf || die
}

src_install() {
	default

	newinitd "${FILESDIR}"/opendmarc.initd opendmarc
	newconfd "${FILESDIR}"/opendmarc.confd opendmarc

	dodir /etc/opendmarc

	# create config file
	sed \
		-e 's:^# UserID .*$:UserID milter:' \
		-e "s:^# PidFile .*:PidFile ${EPREFIX}/var/run/opendmarc/opendmarc.pid:" \
		-e '/^# Socket /s:^# ::' \
		"${S}"/opendmarc/opendmarc.conf.sample \
		> "${ED}"/etc/opendmarc/opendmarc.conf \
		|| die
}
