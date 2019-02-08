#!/bin/bash

echo "Executing core for update.sh"
composer install \
    && cd web \
    && drush cr \
    && drush updb -y \
    && drush cr \
    && drush cim sync -y \
    && drush cr \
    && drush entity-updates -y \
    && echo "Successfully updated."
