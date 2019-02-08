#!/bin/bash
# This bash script will update the project. For production environment use update-prod.sh instead!
git pull && \
    ./scripts/custom/core.update.sh
