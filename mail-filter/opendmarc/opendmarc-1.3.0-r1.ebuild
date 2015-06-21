# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Open source DMARC implementation"
HOMEPAGE="http://sourceforge.net/projects/opendmarc/"
SRC_URI="mirror://sourceforge/project/opendmarc/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-perl/DBI
	mail-filter/libmilter
	mail-filter/libspf2"
RDEPEND="${DEPEND}
	dev-perl/Switch"

src_configure() {
	econf \
		--docdir="${EPREFIX}"/usr/share/doc/${PF} \
		--htmldir="${EPREFIX}"/usr/share/doc/${PF}/html \
		--with-wall \
		--with-spf \
		--with-spf2-include="${EPREFIX}"/usr/include/spf2
		--with-spf2-lib="${EPREFIX}"/usr/lib
}
