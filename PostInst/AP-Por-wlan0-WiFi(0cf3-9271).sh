#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

# ----------
#  Script de NiPeGun para instalar y configurar xxxxxxxxx en Debian
#
#  Ejecución remota:
#  curl -s x | bash
# ----------

apt-get -y update
apt-get -y install firmware-ath9k-htc
apt-get -y install hostapd
apt-get -y install crda

cp /etc/sysctl.conf /etc/sysctl.conf.bak
sed -i -e 's|#net.ipv4.ip_forward=1|net.ipv4.ip_forward=1|g' /etc/sysctl.conf

cp /etc/default/hostapd /etc/default/hostapd.bak
sed -i -e 's|#DAEMON_CONF=""|DAEMON_CONF="/etc/hostapd/hostapd.conf"|g' /etc/default/hostapd
sed -i -e 's|#DAEMON_OPTS=""|DAEMON_OPTS="-dd -t -f /var/log/hostapd.log"|g' /etc/default/hostapd

