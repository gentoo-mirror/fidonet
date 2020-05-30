# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit perl-module git-r3

MY_PN="OLEMacro"
DESCRIPTION="SpamAssassin plugin that that searches attached documents for an OLE Macro"
HOMEPAGE="https://github.com/fmbla/spamassassin-olemacro"

EGIT_REPO_URI="https://github.com/fmbla/spamassassin-olemacro.git"
EGIT_BRANCH="master"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=mail-filter/spamassassin-3.4.4
	dev-perl/Archive-Zip
	dev-perl/IO-String"
RDEPEND="${DEPEND}"

#S="${WORKDIR}"

src_compile() {
	# make sure it doesn't try to look for the .pm in the same dir as the .cf
	sed -rie 's/^(loadplugin.+)[ ]+OLEMacro.pm/\1/' OLEMacro.pre
}

src_install() {
	perl_set_version

	local plugin_dir=${VENDOR_LIB}/Mail/SpamAssassin/Plugin

	insinto ${plugin_dir}
	doins ${MY_PN}.pm

	insinto /etc/mail/spamassassin/
	doins ${MY_PN}.cf
	doins ${MY_PN}.pre

	dodoc README.md
}

pkg_postinst() {
	echo
	elog "You need to restart spamassassin (as root) before this plugin will work:"
	elog "/etc/init.d/spamd restart"
	echo
}
