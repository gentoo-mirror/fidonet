# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

HUSKY_MODULE=${PN#husky-}

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/huskyproject/${HUSKY_MODULE}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/huskyproject/${HUSKY_MODULE}/archive/refs/tags/${HUSKY_MODULE}-${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

inherit gnuconfig

DESCRIPTION="FTN husky ${HUSKY_MODULE} library"
HOMEPAGE="https://huskyproject.github.io/"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="
	>=net-fido/husky-huskylib-1.9.20201016
	>=net-fido/husky-smapi-2.5.20201016
	>=net-fido/husky-fidoconf-1.9.20201016
"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${HUSKY_MODULE}-${HUSKY_MODULE}-${PV}"

src_prepare() {
	default

	# Patch Makefile
	sed -e 's:include \.\.\/huskymak\.cfg:include debian\/huskymak\.cfg:' -i Makefile

	# prevent to strip while installing
	sed -e 's:OPTIBOPT=-c -s -m 555:OPTIBOPT=-c -m 555:' -i debian/huskymak.cfg
}

src_compile() {
	emake \
		PREFIX=/usr \
		CFGDIR=/etc/ftn \
		MANDIR=/usr/share/man \
		HTMLDIR=/usr/share/doc/${P} \
		OPTLFLAGS= \
		OPTCFLAGS= \
		DYNLIBS=1 \
		LDCONFIG= \
		DEBUG=1 \
	|| die "emake failed"

	emake \
		INFODIR=/usr/share/info \
		HTMLDIR=/usr/share/doc/${P}/html \
		html info \
	|| die "emake failed [docs]"
}

src_install() {
	dodir /usr/bin
	emake \
		PREFIX=${D}/usr \
		CFGDIR=${D}/etc/ftn \
		MANDIR=${D}/usr/share/man \
		HTMLDIR=${D}/usr/share/doc/${P} \
		INFODIR=${D}/usr/share/info \
		OPTLFLAGS= \
		OPTCFLAGS= \
		DYNLIBS=1 \
		LDCONFIG= \
		DEBUG=1 \
		install \
	|| die "emake install failed"
	
	insinto /usr/share/doc/${P}
	doins ChangeLog HISTORY
}