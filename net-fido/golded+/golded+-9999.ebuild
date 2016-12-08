# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

ECVS_AUTH="pserver"
ECVS_SERVER="golded-plus.cvs.sourceforge.net:/cvsroot/golded-plus"
ECVS_MODULE="${PN}"
ECVS_LOCALNAME="${PN}"

inherit cvs versionator

DESCRIPTION="FTN Editor ${PN}"
SRC_URI=""
HOMEPAGE="http://golded-plus.sourceforge.net"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
# IUSE="spell -hunspell -doc"
IUSE="-doc"

# DEPEND=">=sys-libs/ncurses-5.4
# 	spell? (
# 		hunspell? (
# 			app-text/hunspell
# 		)
# 	)
# 	doc? ( sys-apps/texinfo )"

DEPEND="sys-libs/ncurses:0
	doc? ( sys-apps/texinfo )"
RDEPEND="${DEPEND}"

# pdep=""
# for l in \
# "af" "bg" "ca" "cs" "cy" "da" "de" "de-alt" "el" "en" \
# "eo" "es" "et" "fo" "fr" "ga" "gl" "he" "hr" "hu" \
# "ia" "id" "it" "ku" "lt" "lv" "mi" "mk" "ms" "nb" \
# "nl" "nn" "pl" "pt" "ro" "ru" "sk" "sl" "sv" "sw" \
# "tn" "uk" "zu" \
# ; do
# dep="linguas_${l}? ( app-dicts/myspell-${l} )"
# [[ -z ${pdep} ]] &&
# pdep="${dep}" ||
# pdep="${pdep}
# ${dep}"
# IUSE="${IUSE} linguas_${l}"
# done

# PDEPEND="spell? ( ${pdep} )"

S="${WORKDIR}/${ECVS_LOCALNAME}"

src_unpack() {
	cvs_src_unpack
}

src_prepare() {
	# use hunspell && (use spell || die "You hould enable 'spell' if you want to use 'hunspell'")

	# use hunspell && ewarn "Dynamic linking with external hunspell library is an experimental feature!"

	# Add header with personal configuration
	cp "${FILESDIR}/mygolded.h" ./golded3/mygolded.h

	# Disable MS Office spellchecker support
	sed -i 's/#CPPFLAGS+=-DGCFG_NO_MSSPELL/CPPFLAGS+=-DGCFG_NO_MSSPELL/' ./Config.def

	# Disable HunSpell spellchecker support if need
	# use spell || sed -i 's/#CPPFLAGS+=-DGCFG_NO_MYSPELL/CPPFLAGS+=-DGCFG_NO_MYSPELL/' ./Config.def
	sed -i 's/#CPPFLAGS+=-DGCFG_NO_MYSPELL/CPPFLAGS+=-DGCFG_NO_MYSPELL/' ./Config.def

	# Patch for dynamic linking of hunspell
	# if use hunspell ; then
	# 	epatch ${FILESDIR}/hunspell-dynlib.patch.bz2 || die "epatch failed"
	# 	rm -rf ./goldlib/hunspell
	# 	HUNSPELL_LIB_VERSION=$( get_version_component_range 1-2 \
	# 	$( echo $( best_version app-text/hunspell ) | sed -e "s~app-text/hunspell~~" ) )
	# 	sed -i "s/STDLIBS+=-lhunspell/STDLIBS+=-lhunspell-${HUNSPELL_LIB_VERSION}/" ./golded3/Makefile
	# fi
}

src_compile() {
	emake PLATFORM=lnx || die "emake failed"
	use doc && (emake docs || die "emake docs failed")
}

src_install() {
	dobin bin/gedlnx bin/gnlnx bin/rddtlnx
	doman docs/*.1
	if useq doc ; then
		dodoc docs/*.txt docs/notework.rus
		dodoc manuals/*.txt
		dohtml docs/*.html
	fi
	insinto /usr/share/golded-plus
	doins bin/screenrc_koi8r
	exeinto /etc/ftn/golded.sample
	doexe bin/golded
	insinto /etc/ftn/golded.sample/charset
	doins cfgs/charset/*
	insinto /etc/ftn/golded.sample/colorset
	doins cfgs/colorset/*
	insinto /etc/ftn/golded.sample/config
	doins cfgs/config/*
	insinto /etc/ftn/golded.sample/template
	doins cfgs/template/*
}
