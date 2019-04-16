# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# now edited with nano 2.3.2 :)
#
# 2. http://www.corbina.net/~maloff/binkd/
#    ftp://happy.kiev.ua/pub/fidosoft/mailer/binkd/
#     The mirrors:
#     ftp://fido.thunderdome.us/pub/mirror/binkd/
#     ftp://cube.sut.ru/pub/mirror/binkd/
#     http://binkd.spb.ru
#
#    Documentation:
#    English manual for binkd 0.9.2
#      http://www.doe.carleton.ca/~nsoveiko/fido/binkd/man/
#                   (c) Nick Soveiko <nsoveiko@doe.carleton.ca>
#    Russian manual for binkd 0.9.9
#      http://binkd.grumbler.org/binkd-ug-ru.htm.win.ru
#                   (c) Stas Degteff 2:5080/102@fidonet
#    FAQ
#      http://binkd.grumbler.org/binkdfaq.shtml

EAPI=3

inherit eutils

DESCRIPTION="Binkd daemon for ftn over ip"
HOMEPAGE="http://www.corbina.net/~maloff/binkd/"
RESTRICT="mirror"
SRC_URI="ftp://happy.kiev.ua/pub/fidosoft/mailer/binkd/snapshot/binkd-1.1.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="aso bwlim +bzip2 doc ntlm perl proxy +zlib"
DEPEND="bzip2? ( >=app-arch/bzip2-1.0.6 ) zlib? ( >=sys-libs/zlib-1.2.3-r1 ) perl? ( dev-lang/perl )"
RDEPEND="${DEPEND}"

#S=${WORKDIR}/${P}
S=${WORKDIR}/binkd-1.1

src_configure() {
	# we make the configure work
	cp "${S}/mkfls/unix/Makefile.dep" "${S}"
	cp "${S}/mkfls/unix/Makefile.in" "${S}"
	cp "${S}/mkfls/unix/configure" "${S}"
	cp "${S}/mkfls/unix/configure.in" "${S}"
	cp "${S}/mkfls/unix/install-sh" "${S}"
	cp "${S}/mkfls/unix/mkinstalldirs" "${S}"
	# now run configure
	local myconf=
	use proxy && myconf="--with-proxy"
	use ntlm && myconf="${myconf} --with-ntlm"
	use aso && myconf="${myconf} --with-aso"
	use bwlim && myconf="${myconf} --with-bwlim"
	use perl && myconf="${myconf} --with-perl"
	# disable zlib if not enabled in use flags
	if ! use zlib; then
		myconf="${myconf} --without-zlib"
	fi
	# disable bzip2 if not enabled in use flags
	if ! use bzip2; then
		myconf="${myconf} --without-bzip2"
	fi
	econf ${myconf} || die "econf failed"
}

src_compile() {
	# compile it
	emake || die "emake failed"
}

src_install() {
	# install conf.d
	newconfd "${FILESDIR}"/binkd.confd binkd
	# install init.d
	newinitd "${FILESDIR}"/binkd.initd binkd
	# make DESTDIR=${D} install || die
	dobin binkd
	# install docs
	doman binkd.8
}
