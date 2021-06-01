# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9 )

inherit distutils-r1

DESCRIPTION="A mail content scanner for postfix written in python"
HOMEPAGE="http://fuglu.org/"
RESTRICT="mirror"
SRC_URI="http://distfiles.overlay.junc.org/fidonet/${PN}-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# milter
IUSE="clamav database dkim redis spamassassin spf"

# what milter works ?
# milter? ( dev-python/pymilter[${PYTHON_USEDEP}] )

# missing python 3.7
# dev-python/rarfile[${PYTHON_USEDEP}]
# >=dev-python/pyspf-2.0.12[${PYTHON_USEDEP}]
# $(python_gen_cond_dep 'dev-python/ipaddress[${PYTHON_USEDEP}]' python2_7)

CDEPEND="acct-user/fuglu
		dev-python/beautifulsoup:4[${PYTHON_USEDEP}]
		!dev-python/filemagic[${PYTHON_USEDEP}]
		dev-python/python-magic[${PYTHON_USEDEP}]
		$(python_gen_cond_dep 'dev-python/ipaddr[${PYTHON_USEDEP}]' python3_7)
		spf? ( dev-python/pyspf[${PYTHON_USEDEP}] )
		database? ( dev-python/sqlalchemy[${PYTHON_USEDEP}] )
		dkim? ( dev-python/dkimpy[${PYTHON_USEDEP}] )
		redis? ( dev-python/redis-py[${PYTHON_USEDEP}] )"

DEPEND="${CDEPEND}
		>=dev-python/packaging-19.2[${PYTHON_USEDEP}]
		>=dev-python/pyparsing-2.4.0[${PYTHON_USEDEP}]
		>=dev-python/six-1.13.0[${PYTHON_USEDEP}]
		>=dev-python/pydns-3.2.1[${PYTHON_USEDEP}]
		dev-python/setuptools[${PYTHON_USEDEP}]
"

RDEPEND="${CDEPEND}
	clamav? ( app-antivirus/clamav )
	spamassassin? ( mail-filter/spamassassin )"

S="${WORKDIR}/${PN}-${PV}"

src_install() {
	distutils-r1_src_install

	dodir /etc/fuglu
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
