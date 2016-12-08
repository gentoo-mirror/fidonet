# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils  git-2

DESCRIPTION="Binkd daemon for ftn over ip"
HOMEPAGE="http://www.corbina.net/~maloff/binkd/"
SRC_URI=""
EGIT_REPO_URI="git://github.com/pgul/binkd.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="aso bwlim +bzip2 doc ntlm perl proxy +zlib"
DEPEND="bzip2? ( >=app-arch/bzip2-1.0.6 ) zlib? ( >=sys-libs/zlib-1.2.3-r1 ) perl? ( dev-lang/perl )"
RDEPEND="${DEPEND}"

#S=${WORKDIR}/${P}
S=${WORKDIR}/binkd-1.0

src_unpack() {
	git-2_src_unpack
}

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
