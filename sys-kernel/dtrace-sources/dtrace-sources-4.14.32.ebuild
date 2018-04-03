# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
K_SECURITY_UNSUPPORTED="1"
ETYPE="sources"
inherit kernel-2
detect_version

DESCRIPTION="Full sources for the Linux kernel with dtrace support patch"
HOMEPAGE="https://oss.oracle.com"
SRC_URI="${KERNEL_URI}"

IUSE="+header-link"
KEYWORDS="~amd64"
RDEPEND="sys-kernel/linux-headers dev-libs/elfutils dev-libs/libdtrace-ctf"

# epatch deletes empty files, which breaks build
EPATCH_COMMON_OPTS="-g0 --no-backup-if-mismatch"

# head for 4.14.21 2018/3/5
HEAD="547e93daabfdfed3ff9ce89611856842c3080176"
CONFIG="v4.14.26-1"

ORAGIT="https://oss.oracle.com/git/gitweb.cgi"
SNAP_URI="${ORAGIT}?p=dtrace-linux-kernel.git;a=snapshot;sf=tgz;h=${HEAD}"
CONFIG_URI="${ORAGIT}?p=linux-uek5.git;a=blob_plain;f=uek-rpm/ol7/config-x86_64;hb=${CONFIG}"

src_prepare() {
	# fix kernel/traps.c to be able to patch cleanly
	epatch "${FILESDIR}/kernel_traps_fix.patch"

	# patch DTrace
	epatch "${FILESDIR}/${PN}-${HEAD}.patch"
	epatch "${FILESDIR}/dwarf2ctf_allow_root.patch"

	# add config
	cp ${FILESDIR}/uek5-config ${S}/.config
	epatch "${FILESDIR}/uek5-config.patch"

	eapply_user
}

pkg_postinst() {
	use header-link && \
		ln -sf ${ROOT}/usr/src/linux-${PV}-dtrace/include/uapi/linux/dtrace \
		${ROOT}/usr/include/linux/dtrace
}

pkg_prerm() {
	use header-link && rm -f ${ROOT}/usr/include/linux/dtrace
}

