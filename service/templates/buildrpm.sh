fpm -t rpm \
  -p oint-%1-1.noarch_%2.rpm \
  --rpm-os linux \
  --depends libicu \
  --name oint \
  -s dir \
  --license mit \
  --version %1 \
  --architecture all \
  --category "Development" \
  --description "$(cat description_%2.txt)" \
  --url "%3" \
  --maintainer "%4" \
  --after-install postinst.sh \
  --verbose \
  ../ci/installer_set/=/usr %5=/usr/lib/oint/bin
