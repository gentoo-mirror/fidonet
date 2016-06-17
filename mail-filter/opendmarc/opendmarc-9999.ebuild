# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools eutils git-r3 user

DESCRIPTION="Open source DMARC implementation"
HOMEPAGE="http://sourceforge.net/projects/opendmarc/ https://sourceforge.net/u/pktomo/opendmarc/ci/develop/tree/"
SRC_URI=""
EGIT_REPO_URI="git://git.code.sf.net/u/pktomo/opendmarc"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~x86 ~x86-fbsd"
IUSE="spf"

DEPEND="dev-perl/DBI
	mail-filter/libmilter"
RDEPEND="${DEPEND}
	dev-perl/Switch
	spf? ( mail-filter/libspf2 )"

pkg_setup() {
	enewgroup milter
	enewuser milter -1 -1 /var/lib/milter milter
}

src_unpack() {
	git-r3_src_unpack
}

src_prepare() {
	eautoreconf || die
}

src_configure() {
	econf \
		--docdir="${EPREFIX}"/usr/share/doc/${PF} \
		--htmldir="${EPREFIX}"/usr/share/doc/${PF}/html \
		$(use_with spf)
}

src_install() {
	default

	newinitd "${FILESDIR}"/opendmarc.initd opendmarc
	newconfd "${FILESDIR}"/opendmarc.confd opendmarc

	dodir /etc/opendmarc
	dodir /var/run/opendmarc
	fowners milter:milter /var/run/opendmarc

	# create config file
	sed \
		-e 's/^# UserID .*$/UserID milter/' \
		-e 's/^# PidFile .*/PidFile \/var\/run\/opendmarc\/opendmarc.pid/' \
		-e '/^# Socket /s/^# //' \
		"${S}"/opendmarc/opendmarc.conf.sample \
		> "${ED}"/etc/opendmarc/opendmarc.conf \
		|| die
}
