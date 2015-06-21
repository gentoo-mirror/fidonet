# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit toolchain-funcs

DESCRIPTION="MakeNL the Nodelist maker"
HOMEPAGE="http://makenl.sourceforge.net"
RESTRICT="mirror"
# ARG uppper case filename on unix servers with lowercase ebuilds :)
SRC_URI="http://www.filegate.net/coordutl/MN341SRC.ZIP"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

S=${WORKDIR}/${P}/src

src_prepare() {
sed -i -e '/CFLAGS+=/d' makefile.linux || die
}

src_compile() {
emake -f makefile.linux CC="$(tc-getCC)" || die
}

src_install() {
dobin makenl || die
cd ../docs
dodoc karcher.eng makenl.prn read.me *.txt || die
insinto /usr/share/doc/${PF}/examples
doins *.ctl || die
}
