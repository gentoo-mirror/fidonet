# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils flag-o-matic user systemd git-r3

DESCRIPTION="OpenARC milter"
HOMEPAGE="https://github.com/trusteddomainproject/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/trusteddomainproject/OpenARC.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~sparc-solaris ~x86-solaris"
IUSE="-selinux"

CDEPEND=""
DEPEND="${CDEPEND}
	=sys-devel/automake-1.14.1-r1
	virtual/pkgconfig"
RDEPEND="${CDEPEND}
	selinux? ( sec-policy/selinux-clamav )"

DOCS=( AUTHORS BUGS ChangeLog FAQ INSTALL NEWS README UPGRADE )

src_unpack() {
	git-r3_src_unpack
}

pkg_setup() {
	enewgroup milter
	enewuser milter -1 -1 /dev/null milter
}

# src_prepare() {
# 	use ppc64 && append-flags -mminimal-toc
# 	use uclibc && export ac_cv_type_error_t=yes
# }

# src_configure() {
# 	econf \
# }

src_install() {
	default
}

# pkg_postinst() {
# 	if use milter ; then
# 		elog "For simple instructions how to setup the clamav-milter read the"
# 		elog "clamav-milter.README.gentoo in /usr/share/doc/${PF}"
# 	fi
# 	if test -z $(find "${ROOT}"var/lib/clamav -maxdepth 1 -name 'main.c*' -print -quit) ; then
# 		ewarn "You must run freshclam manually to populate the virus database files"
# 		ewarn "before starting clamav for the first time.\n"
# 	fi
# }
