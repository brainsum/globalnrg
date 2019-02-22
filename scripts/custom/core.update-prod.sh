#!/bin/bash

echo "Executing core for update-prod.sh"
composer install --no-dev -o \
    && cd web \
    && ../vendor/bin/drush cr \
    && ../vendor/bin/drush updb -y \
    && ../vendor/bin/drush cr \
    && ../vendor/bin/drush cim sync -y \
    && ../vendor/bin/drush cr \
    && ../vendor/bin/drush entity-updates -y \
    || exit -1

CIMTESTRET=$( { ../vendor/bin/drush cim -n; } 2>&1 )
if [[ ${CIMTESTRET} == "There are no changes to import"* ]]; then
  echo "Config import successful.";
else
  echo "Config import was not completely successful.";
  exit -1;
fi
