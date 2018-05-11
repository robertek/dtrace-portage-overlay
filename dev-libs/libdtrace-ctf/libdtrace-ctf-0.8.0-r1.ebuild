# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="CTF library"
HOMEPAGE="https://github.com/oracle/libdtrace-ctf"
SRC_URI="https://github.com/oracle/${PN}/archive/${P}.tar.gz"

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
