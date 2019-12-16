# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit perl-module

DESCRIPTION="SpamAssassin plugin that attempts to extract text from spam images"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="http://distfiles.overlay.junc.org/fidonet/${PN}-${PV}.tar.gz -> TesseractOcr-${PV}.tar.gz"
RESTRICT="mirror"

LICENSE="Apache-2.0 GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DEPEND="mail-filter/spamassassin perl-gcpan/Image-OCR-Tesseract virtual/perl-Time-HiRes"
RDEPEND="${DEPEND}"

src_prepare() {
	default
}
src_install() {
	perl_set_version
	default
	insinto /etc/mail/spamassassin/plugins
	doins lib/Mail/SpamAssassin/Plugin/TesseractOcr.pm || die "Mail/SpamAssassin/Plugin/TesseractOcr.pm"
	insinto /etc/mail/spamassassin/
	doins TesseractOcr.cf || die "TesseractOcr.cf"
}
pkg_postinst() {
	elog "You need to restart spamassassin (as root) before this plugin will work:"
	elog "/etc/init.d/spamd restart"
}
