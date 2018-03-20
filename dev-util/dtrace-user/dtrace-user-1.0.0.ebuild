# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MINOR=8

DESCRIPTION="DTrace userspace"
HOMEPAGE="https://oss.oracle.com"
SRC_URI="https://oss.oracle.com/git/gitweb.cgi?p=dtrace-utils.git;a=snapshot;sf=tgz;h=refs/tags/${PN}-${PV}-${MINOR} -> $P.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"

RDEPEND="dev-libs/elfutils sys-libs/zlib dev-libs/libdtrace-ctf"
DEPEND="${DEPEND} virtual/os-headers sys-devel/bison sys-devel/flex"

src_unpack() {
		unpack ${A}
		mv ${WORKDIR}/dtrace-utils-${PN}-${PV}-${MINOR} ${WORKDIR}/${P}
		use test || rm -r ${WORKDIR}/${P}/test
}
