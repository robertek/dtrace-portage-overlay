# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="CTF library"
HOMEPAGE="https://oss.oracle.com"
SRC_URI="https://oss.oracle.com/git/gitweb.cgi?p=$PN.git;a=snapshot;sf=tgz;h=refs/tags/$P -> $P.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

RDEPEND="dev-libs/elfutils sys-libs/zlib"
DEPEND="${DEPEND} virtual/os-headers"

src_unpack() {
		unpack ${A}
		mv ${WORKDIR}/${PN}-${P} ${WORKDIR}/${P}
}
