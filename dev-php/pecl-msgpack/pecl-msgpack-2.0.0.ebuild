# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php/pecl-msgpack/pecl-msgpack-2.0.0.ebuild,v 1.0 2014/05/02 19:36:03 mabi Exp $

EAPI="5"

PHP_EXT_NAME="msgpack"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
DOCS="CREDITS EXPERIMENTAL README"

USE_PHP="php7-0 php5-6"

inherit php-ext-pecl-r2

KEYWORDS="~amd64 ~x86"

DESCRIPTION="Support for msgpack serialization"
HOMEPAGE="http://msgpack.org/"
LICENSE="MIT"
SLOT="0"
IUSE=""