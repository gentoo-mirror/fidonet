# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit autotools flag-o-matic lua-single systemd

DESCRIPTION="Anti-Abuse for servers at authentication time"
HOMEPAGE="https://powerdns.github.io/weakforced/"
SRC_URI="https://github.com/PowerDNS/weakforced/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
		https://raw.githubusercontent.com/ua-parser/uap-core/dc85ab2628798538a2874dea4a9563f40a31f55a/regexes.yaml"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="dns geoip sodium systemd trackalert"
REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND="acct-group/wforce
		acct-user/wforce
		dev-cpp/drogon
		dev-cpp/prometheus-cpp
		dev-cpp/trantor
		dev-cpp/yaml-cpp
		dev-libs/boost:=
		geoip? (
			dev-libs/geoip
			dev-libs/libmaxminddb
		)
		dev-libs/hiredis
		dev-libs/jsoncpp
		sodium? ( dev-libs/libsodium )
		dev-libs/openssl
		dev-libs/protobuf
		dns? ( net-dns/getdns )
		net-misc/curl
		sys-apps/util-linux
		sys-libs/zlib"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=( "${FILESDIR}/${P}-trackalert-drop-libtermcap-dependency.patch" )

src_prepare() {
	# required to avoid wget call which will be blocked by sandbox
	cp "${DISTDIR}/regexes.yaml" "${S}/wforce" || die

	eautoreconf
	default
}

src_configure() {
	# linking against libprometheus-cpp fails with ld.lld
	filter-flags '-fuse-ld=lld' '-Wl,--threads=*'

	econf \
		$(use_enable dns) \
		$(use_enable geoip) \
		$(use_enable sodium) \
		$(use_enable systemd) \
		$(use_enable trackalert) \
		$(use_with lua_single_target_luajit luajit) \
		--sysconfdir=/etc/weakforced \
		--with-lua="${ELUA}"
}

src_install() {
	dobin "${S}/wforce/wf_dump_entries"
	dobin "${S}/wforce/wforce"

	dodir /etc/weakforced
	fowners wforce:wforce /etc/weakforced
	fperms 700 /etc/weakforced
	insinto /etc/weakforced
	doins "${S}/wforce/regexes.yaml"
	doins "${S}/wforce/wforce.conf"

	newinitd "${FILESDIR}/wforce.init" wforce
	if use systemd; then
		systemd_dounit "${S}/wforce/wforce.service"
	else
		newconfd "${FILESDIR}/wforce.confd" "${PN}"
	fi

	if use trackalert; then
		dobin "${S}/trackalert/trackalert"
		insinto /etc/weakforced
		doins "${S}/trackalert/trackalert.conf"

		newinitd "${FILESDIR}/trackalert.init" trackalert
		if use systemd; then
			systemd_dounit "${S}/trackalert/trackalert.service"
		else
			newconfd "${FILESDIR}/trackalert.confd" trackalert
		fi
	fi
}
