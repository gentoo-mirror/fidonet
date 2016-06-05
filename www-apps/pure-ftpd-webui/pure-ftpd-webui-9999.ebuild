# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit user webapp git-r3

DESCRIPTION="Web Based Management tool for Pure-ftpd style virtual domains and users"
HOMEPAGE="http://github.com/mazay"
SRC_URI=""
EGIT_REPO_URI="git://github.com/mazay/pure-ftpd-webui.git"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="mysql postgres sqlite"
REQUIRED_USE="|| ( mysql postgres )"

DEPEND=""
RDEPEND="${DEPEND}
	virtual/httpd-php
	mysql? ( || ( dev-lang/php:5.6[mysqli] dev-lang/php:5.6[mysql] ) )"

need_httpd_cgi

src_unpack() {
	git-r3_src_unpack
}

pkg_setup() {
	webapp_pkg_setup
}

src_install() {

	#insinto /usr/share/doc/${PF}/
	#doins -r ADDITIONS

	#local docs="DOCUMENTS/*.txt INSTALL.TXT CHANGELOG.TXT"
	#dodoc ${docs}

	insinto "${MY_HTDOCSDIR}"
	doins -r .

	# webapp_configfile "${MY_HTDOCSDIR}"/config.inc.php
	# webapp_postinst_txt en "${FILESDIR}"/postinstall-en-2.3.txt

	webapp_src_install
}

pkg_postinst() {
	webapp_pkg_postinst
}
