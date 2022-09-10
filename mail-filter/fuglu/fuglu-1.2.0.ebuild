# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_10 )

inherit distutils-r1

DESCRIPTION="A mail content scanner for postfix written in python"
HOMEPAGE="http://fuglu.org/"
# SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

RESTRICT="mirror"
SRC_URI="http://fido.junc.eu/fidonet/${PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# milter
IUSE="clamav database dkim dmarc redis spamassassin spf"

DEPEND="acct-user/fuglu
	>=dev-python/beautifulsoup4-4.9.3[${PYTHON_USEDEP}]
	>=dev-python/packaging-21.0[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.13.0[${PYTHON_USEDEP}]
	>=dev-python/domainmagic-0.0.12[${PYTHON_USEDEP}]
	dev-python/ipaddr[${PYTHON_USEDEP}]
	dev-python/python-magic[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]"

RDEPEND="clamav? ( app-antivirus/clamav )
	database? ( dev-python/sqlalchemy )
	dkim? ( dev-python/dkimpy )
	dmarc? ( dev-python/dmarc )
	redis? ( dev-python/redis-py )
	spamassassin? ( mail-filter/spamassassin )
	spf? ( dev-python/pyspf )
"

S="${WORKDIR}/${PN}-${PV}"

src_install() {
	distutils-r1_src_install

	dodir /etc/fuglu
	dodir /etc/fuglu/conf.d
	dodir /usr/share/${PN}
	dodir /var/log/${PN}
	keepdir /var/log/${PN}
	dodir /var/tmp/${PN}
	keepdir /var/tmp/${PN}

	mv "${D}"/etc/fuglu/* "${D}"/usr/share/${PN} || die
	sed -i -e "s#^tempdir=.*#tempdir=/var/tmp/${PN}#g" "${D}"/usr/share/${PN}/${PN}.conf.dist || die
	sed -i -e "s#^debugfile=.*#debugfile=/var/log/${PN}/debug.log#g" "${D}"/usr/share/${PN}/${PN}.conf.dist || die
	sed -i -r 's/(user|group)=.*/\1=fuglu/g' "${D}"/usr/share/${PN}/${PN}.conf.dist || die

	fperms 0700 /var/tmp/${PN}
	fowners ${PN}:${PN} /var/log/${PN}
	fowners ${PN}:${PN} /var/tmp/${PN}

	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	newconfd "${FILESDIR}"/${PN}.confd ${PN}
}

pkg_postinst() {
	einfo "Upstreams default configuration has been installed into /usr/share/${PN}."
	einfo "Before you can use ${PN}, you have to copy it to /etc/${PN} and remove the .dist extension"
}
