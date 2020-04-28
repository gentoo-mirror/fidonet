# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_7 )
PYTHON_REQ_USE="ipv6?"
inherit distutils-r1

DESCRIPTION="Python implementation of the Sender Policy Framework (SPF) protocol"
HOMEPAGE="https://pypi.org/project/pyspf/"
RESTRICT="mirror"
SRC_URI="http://distfiles.overlay.junc.org/fidonet/${PN}-${PV}.tar.gz -> ${P}.tar.gz"
# SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}t.tar.gz"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ipv6 test"
RESTRICT="!test? ( test )"

# >=python-3.3 comes with the built-in ipaddress module
# $(python_gen_cond_dep '>=dev-python/ipaddr-2.1.10[${PYTHON_USEDEP}]' python2_7)
# $(python_gen_cond_dep 'dev-python/pydns:2[${PYTHON_USEDEP}]' python2_7)

RDEPEND="dev-python/authres[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/pydns:3[${PYTHON_USEDEP}]' 'python3*')"

DEPEND="test? ( ${RDEPEND}
	dev-python/pyyaml[${PYTHON_USEDEP}] )"

REQUIRED_USE="test? ( ipv6 )"

python_test() {
	pushd test &> /dev/null
	"${PYTHON}" testspf.py || die
	popd &> /dev/null
}
