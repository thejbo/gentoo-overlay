# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit systemd user unpacker

DESCRIPTION="Scalable datastore for metrics, events, and real-time analytics"
HOMEPAGE="http://influxdb.com"
SRC_URI="https://dl.influxdata.com/influxdb/releases/${PN}2-${PV}-amd64.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

COMMON_DEPEND="
  acct-group/influxdb
  acct-user/influxdb"
DEPEND="${COMMON_DEPEND}"
RDEPEND="${COMMON_DEPEND}"

src_unpack() {
  mkdir -p ${WORKDIR}/${P}
  cd ${WORKDIR}/${P}
  unpack_deb ${A}
  mkdir -p var/log/${PN}
  mkdir -p var/lib/${PN}

}

src_install() {
  cp -Rp * "${D}"
  mkdir /etc/${PN}/

  systemd_dounit "${FILESDIR}/${PN}.service"

  cp "${FILESDIR}/influxd-systemd-start.sh" "/usr/lib/influxdb/scripts/influxd-systemd-start.sh"
  cp "${FILESDIR}/${PN}.yaml" "/etc/${PN}/${PN}.yaml"

  fowners ${PN}:${PN} /var/log/${PN}
  fowners ${PN}:${PN} /var/lib/${PN}
}
