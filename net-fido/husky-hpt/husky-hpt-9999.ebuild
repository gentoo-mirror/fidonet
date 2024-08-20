# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

HUSKY_MODULE=${PN#husky-}

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/huskyproject/${HUSKY_MODULE}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/huskyproject/${HUSKY_MODULE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

inherit cmake-multilib optfeature

DESCRIPTION="FTN husky ${HUSKY_MODULE} library"
HOMEPAGE="https://huskyproject.github.io/"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="
	>=net-fido/husky-huskylib-1.9.20201016
	>=net-fido/husky-smapi-2.5.20201016
	>=net-fido/husky-fidoconf-1.9.20201016
	>=net-fido/husky-areafix-1.9.20201103
	>=net-fido/husky-hptzip-1.9.20190108
"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${HUSKY_MODULE}-${PV}"

DOCS="${S}/BUGS ${S}/CREDITS ${S}/ChangeLog ${S}/HISTORY ${S}/README.md ${S}/TODO"

multilib_src_install() {
	cmake_src_install
	insinto /etc/ftn
	newins ${S}/config/config config.example.${HUSKY_MODULE}
	newins ${S}/config/areas areas.example.${HUSKY_MODULE}
	newins ${S}/config/links links.example.${HUSKY_MODULE}
	newins ${S}/config/packer packer.example.${HUSKY_MODULE}
	newins ${S}/config/route route.example.${HUSKY_MODULE}
	
	doman ${S}/man/*.*

	makeinfo ${S}/doc/${HUSKY_MODULE}.texi -o ${S}/${HUSKY_MODULE}.info
	doinfo ${S}/${HUSKY_MODULE}.info
}

pkg_postinst() {
       optfeature "Perl support" dev-lang/perl
}
