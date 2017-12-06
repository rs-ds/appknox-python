#!/bin/bash

set -xeuo pipefail

export CURRENT_BRANCH
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
git push origin "$CURRENT_BRANCH:$CURRENT_BRANCH"
git push --tags

bumpversion patch

rm -rf dist/
python setup.py sdist
python setup.py bdist_wheel
twine upload dist/*
