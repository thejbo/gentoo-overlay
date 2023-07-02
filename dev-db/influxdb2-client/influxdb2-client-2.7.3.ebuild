# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit unpacker

DESCRIPTION="CLI for InfluxDB v2"
HOMEPAGE="http://influxdb.com"
SRC_URI="https://dl.influxdata.com/influxdb/releases/influxdb2-client-${PV}-linux-amd64.tar.gz"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

src_unpack() {
  mkdir -p ${WORKDIR}/${P}
  cd ${WORKDIR}/${P}
  unpack ${A}
}

src_install() {
  cp "${S}/influx" "/usr/local/bin/"
}
