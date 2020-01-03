# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools db-use eutils systemd git-r3 user

DESCRIPTION="A milter-based application to provide DKIM signing and verification"
HOMEPAGE="http://opendkim.org https://sourceforge.net/u/pktomo/opendkim/ci/master/tree/ https://github.com/trusteddomainproject/OpenDKIM/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/trusteddomainproject/OpenDKIM.git"

LICENSE="Sendmail-Open-Source BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+berkdb gnutls ldap lmdb libressl lua memcached opendbx sasl selinux +ssl static-libs unbound"

DEPEND="|| ( mail-filter/libmilter mail-mta/sendmail )
	dev-libs/libbsd
	ssl? (
		!libressl? ( dev-libs/openssl:0= )
		libressl? ( dev-libs/libressl:0= )
	)
	berkdb? ( >=sys-libs/db-3.2:* )
	opendbx? ( >=dev-db/opendbx-1.4.0 )
	lua? ( dev-lang/lua:* )
	ldap? ( net-nds/openldap )
	lmdb? ( dev-db/lmdb )
	memcached? ( dev-libs/libmemcached )
	sasl? ( dev-libs/cyrus-sasl )
	unbound? ( >=net-dns/unbound-1.4.1 net-dns/dnssec-root )
	!unbound? ( net-libs/ldns )
	gnutls? ( >=net-libs/gnutls-2.11.7 )"

RDEPEND="${DEPEND}
	sys-process/psmisc
	selinux? ( sec-policy/selinux-dkim )
"

REQUIRED_USE="sasl? ( ldap )"

pkg_setup() {
	enewgroup milter
	enewuser milter -1 -1 /var/lib/milter milter
}

src_unpack() {
	git-r3_src_unpack
}

src_prepare() {
	default
	# sed -i -e 's:/var/db/dkim:/etc/opendkim:g' -e 's:/var/db/opendkim:/var/lib/opendkim:g' -e 's:/etc/mail:/etc/opendkim:g' -e 's:mailnull:milter:g' -e 's:^#[[:space:]]*PidFile.*:PidFile /run/opendkim/opendkim.pid:' opendkim/opendkim.conf.sample opendkim/opendkim.conf.simple.in stats/opendkim-reportstats{,.in} || die "sed1"
	# sed -i -e 's:dist_doc_DATA:dist_html_DATA:' libopendkim/docs/Makefile.am || die "sed2"
	# sed -i -e '/sock.*mt.getcwd/s:mt.getcwd():"/tmp":' opendkim/tests/*.lua || die "sed3"
	# sed -i -e '/sock.*mt.getcwd/s:mt.getcwd():"/proc/self/cwd":' opendkim/tests/*.lua || die "sed4"
	eautoreconf
}

src_configure() {
	local myconf
	if use berkdb ; then
		myconf=$(db_includedir)
		myconf="--with-db-incdir=${myconf#-I}"
		myconf+=" --enable-popauth"
		myconf+=" --enable-query_cache"
		myconf+=" --enable-stats"
	fi
	if use unbound; then
		myconf+=" --with-unbound"
	else
		myconf+=" --with-ldns"
	fi
	if use ldap; then
		myconf+=" $(use_with sasl)"
	fi
	econf \
		$(use_with berkdb db) \
		$(use_with opendbx odbx) \
		$(use_with lua) \
		$(use_enable lua rbl) \
		$(use_with ldap openldap) \
		$(use_with lmdb) \
		$(use_enable poll) \
		$(use_enable static-libs static) \
		$(use_with gnutls) \
		$(use_with memcached libmemcached) \
		${myconf} \
		--docdir=/usr/share/doc/${PF} \
		--htmldir=/usr/share/doc/${PF}/html \
		--enable-filter \
		--enable-atps \
		--enable-identity_header \
		--enable-rate_limit \
		--enable-resign \
		--enable-replace_rules \
		--enable-default_sender \
		--enable-sender_macro \
		--enable-vbr \
		--disable-live-testing
		#--with-test-socket=/tmp/opendkim-$(echo ${RANDOM})-S
		#--disable-rpath
}

src_compile() {
	emake runstatedir=/run
}

src_install() {
	default
	find "${D}" -name '*.la' -type f -delete || die

	dosbin stats/opendkim-reportstats

	newinitd "${FILESDIR}/opendkim.openrc" "${PN}"
	# seems removed in github
	# systemd_newtmpfilesd "${S}/contrib/systemd/opendkim.tmpfiles" "${PN}.conf"
	systemd_newunit "${FILESDIR}/opendkim.service" "${PN}.service"

	dodir /etc/opendkim
	keepdir /var/lib/opendkim

	# The OpenDKIM data (particularly, your keys) should be read-only to
	# the UserID that the daemon runs as.
	fowners root:opendkim /var/lib/opendkim
	fperms 750 /var/lib/opendkim

	# Tweak the "simple" example configuration a bit before installing
	# it unconditionally.
	local cf="${T}/opendkim.conf"
	# Some MTAs are known to break DKIM signatures with "simple"
	# canonicalization [1], so we choose the "relaxed" policy
	# over OpenDKIM's current default settings.
	# [1] https://wordtothewise.com/2016/12/dkim-canonicalization-or-why-microsoft-breaks-your-mail/
	sed -E -e 's:^(Canonicalization)[[:space:]]+.*:\1\trelaxed/relaxed:' \
		"${S}/opendkim/opendkim.conf.simple" >"${cf}" || die
	cat >>"${cf}" <<EOT || die

# The UMask is really only used for the PID file (root:root) and the
# local UNIX socket, if you're using one. It should be 0117 for the
# socket.
UMask			0117
UserID			opendkim

# For use with unbound
#TrustAnchorFile	/etc/dnssec/root-anchors.txt
EOT
	insinto /etc/opendkim
	doins "${cf}"
}

# src_install() {
# 	emake DESTDIR="${D}" install
# 
# 	dosbin stats/opendkim-reportstats
# 
# 	newinitd "${FILESDIR}/opendkim.init.r5" opendkim
# 	systemd_dounit "${FILESDIR}/opendkim-r1.service"
# 
# 	dodir /etc/opendkim /var/lib/opendkim
# 	fowners milter:milter /var/lib/opendkim
# 
# 	# default configuration
# 	if [ ! -f "${ROOT}"/etc/opendkim/opendkim.conf ]; then
# 		grep ^[^#] "${S}"/opendkim/opendkim.conf.simple \
# 			> "${D}"/etc/opendkim/opendkim.conf
# 		if use unbound; then
# 			echo TrustAnchorFile /etc/dnssec/root-anchors.txt >> "${D}"/etc/opendkim/opendkim.conf
# 		fi
# 		echo UserID milter >> "${D}"/etc/opendkim/opendkim.conf
# 		if use berkdb; then
# 			echo Statistics /var/lib/opendkim/stats.dat >> \
# 				"${D}"/etc/opendkim/opendkim.conf
# 		fi
# 	fi
# 
# 	use static-libs || find "${D}" -name "*.la" -delete
# }

pkg_postinst() {
	if [[ -z ${REPLACING_VERSION} ]]; then
		elog "If you want to sign your mail messages and need some help"
		elog "please run:"
		elog "  emerge --config ${CATEGORY}/${PN}"
		elog "It will help you create your key and give you hints on how"
		elog "to configure your DNS and MTA."

		ewarn "Make sure your MTA has r/w access to the socket file."
		ewarn "This can be done either by setting UMask to 002 and adding MTA's user"
		ewarn "to milter group or you can simply set UMask to 000."
	fi
}

pkg_config() {
	local selector keysize pubkey

	read -p "Enter the selector name (default ${HOSTNAME}): " selector
	[[ -n "${selector}" ]] || selector=${HOSTNAME}
	if [[ -z "${selector}" ]]; then
		eerror "Oddly enough, you don't have a HOSTNAME."
		return 1
	fi
	if [[ -f "${ROOT}"etc/opendkim/${selector}.private ]]; then
		ewarn "The private key for this selector already exists."
	else
		keysize=1024
		# generate the private and public keys
		opendkim-genkey -b ${keysize} -D "${ROOT}"etc/opendkim/ \
			-s ${selector} -d '(your domain)' && \
			chown milter:milter \
			"${ROOT}"etc/opendkim/"${selector}".private || \
				{ eerror "Failed to create private and public keys." ; return 1; }
		chmod go-r "${ROOT}"etc/opendkim/"${selector}".private
	fi

	# opendkim selector configuration
	echo
	einfo "Make sure you have the following settings in your /etc/opendkim/opendkim.conf:"
	einfo "  Keyfile /etc/opendkim/${selector}.private"
	einfo "  Selector ${selector}"

	# MTA configuration
	echo
	einfo "If you are using Postfix, add following lines to your main.cf:"
	einfo "  smtpd_milters     = unix:/var/run/opendkim/opendkim.sock"
	einfo "  non_smtpd_milters = unix:/var/run/opendkim/opendkim.sock"
	einfo "  and read http://www.postfix.org/MILTER_README.html"

	# DNS configuration
	einfo "After you configured your MTA, publish your key by adding this TXT record to your domain:"
	cat "${ROOT}"etc/opendkim/${selector}.txt
	einfo "t=y signifies you only test the DKIM on your domain. See following page for the complete list of tags:"
	einfo "  http://www.dkim.org/specs/rfc4871-dkimbase.html#key-text"
}
