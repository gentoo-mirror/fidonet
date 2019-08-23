# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools eutils

DESCRIPTION="Advanced, easy to use, asynchronous-capable DNS client library and utilities."
HOMEPAGE="https://www.gnu.org/software/adns/"
RESTRICT="mirror"
# http://www.chiark.greenend.org.uk/~ian/adns/adns.tar.gz
SRC_URI="http://distfiles.overlay.junc.org/fidonet/${PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-vs-LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""

src_prepare() {
	default
	eautoreconf
}
