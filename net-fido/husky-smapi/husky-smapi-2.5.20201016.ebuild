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

inherit cmake-multilib

DESCRIPTION="FTN husky ${HUSKY_MODULE} library"
HOMEPAGE="https://huskyproject.github.io/"

LICENSE="LGPL-2.1"
SLOT="0"
IUSE=""

DEPEND=">=net-fido/husky-huskylib-1.9.20201016"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${HUSKY_MODULE}-${PV}"

DOCS="${S}/BUGS ${S}/ChangeLog ${S}/HISTORY ${S}/README.md ${S}/TODO ${S}/file_id.diz"
