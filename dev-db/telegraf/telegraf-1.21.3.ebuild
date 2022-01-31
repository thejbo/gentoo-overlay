# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit systemd user unpacker

DESCRIPTION="A plugin-driven server agent for reporting metrics into InfluxDB"
HOMEPAGE="http://influxdb.com"
SRC_URI="https://dl.influxdata.com/telegraf/releases/${PN}_${PV}-1_amd64.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"

pkg_setup() {
  enewgroup ${PN}
  enewuser ${PN} -1 -1 -1 ${PN}
}

src_unpack() {
  mkdir -p ${WORKDIR}/${P}
  cd ${WORKDIR}/${P}
  unpack_deb ${A}
}

src_install() {
  cp -Rp * "${D}"
  systemd_dounit "${FILESDIR}/${PN}.service" "${PN}"
  fowners ${PN}:${PN} /var/log/${PN}
}