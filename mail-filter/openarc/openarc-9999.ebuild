# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools db-use eutils systemd git-r3 user

DESCRIPTION="A milter-based application to provide OpenARC"
HOMEPAGE="https://github.com/trusteddomainproject/OpenARC/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/trusteddomainproject/OpenARC.git"

LICENSE="Sendmail-Open-Source BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="mail-filter/libmilter
	dev-libs/libbsd
	dev-libs/openssl
"

RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup milter
	enewuser milter -1 -1 /var/lib/milter milter
}

src_unpack() {
	git-r3_src_unpack
}

src_prepare() {
	default
	eautoreconf
}

src_install() {
	default
	newinitd "${FILESDIR}/openarc.initrc" "${PN}"
}
