# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
#inherit go-module
inherit autotools

DESCRIPTION="AWS SSM Agent"
HOMEPAGE="https://github.com/aws/amazon-ssm-agent/"
SRC_URI="https://github.com/aws/amazon-ssm-agent/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
#https://github.com/aws/amazon-ssm-agent/archive/refs/tags/3.2.815.0.tar.gz

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~riscv"

DEPEND="dev-lang/go"

#RESTRICT="test"

#DOCS=( {README,CHANGELOG}.md )

src_unpack() {
    default
}

src_compile() {
  emake build-linux
}

src_install() {
  keepdir /var/log/aws
  newinitd "${FILESDIR}/${PN}.initd" "${PN}"
  dobin bin/linux_amd64/*
  #einstalldocs
}
