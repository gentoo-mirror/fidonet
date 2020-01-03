# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools eutils flag-o-matic user systemd

DESCRIPTION="OpenARC milter"
HOMEPAGE="http://www.trusteddomain.org/openarc/"
SRC_URI="https://github.com/trusteddomainproject/OpenARC/archive/v1.0.0.Beta0.tar.gz"

LICENSE="BSD-2 Sendmail"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~sparc-solaris ~x86-solaris"
IUSE=""

CDEPEND=""
DEPEND="${CDEPEND}
	=sys-devel/automake-1.15.1-r2
	virtual/pkgconfig"
RDEPEND="${CDEPEND}"

DOCS=( README )

S="${WORKDIR}"/OpenARC-1.0.0.Beta0

pkg_setup() {
	enewgroup milter
	enewuser milter -1 -1 /dev/null milter
}

src_prepare() {
	eautoreconf || die
}

src_install() {
	default
	newinitd "${FILESDIR}/openarc.initrc" openarc
}
