fpm -t deb \
  -p oint_%1_all_%2.deb \
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
