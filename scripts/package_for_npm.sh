#!/bin/bash

set -ex

echo "Packaging $STANDALONE_PACKAGE_NAME.$EXTENSION for npm as $NPM_PACKAGE_NAME.$EXTENSION"

mkdir -p dist

cd build
cp pact-provider-verifier-${GEM_VERSION}/pkg/pact-provider-verifier-* .
rm -rf $STANDALONE_PACKAGE_NAME

if [ $EXTENSION = "zip" ]; then
  unzip $STANDALONE_PACKAGE_NAME.$EXTENSION
else
  tar -xzf $STANDALONE_PACKAGE_NAME.$EXTENSION
fi

cp ../$SUFFIX/* $STANDALONE_PACKAGE_NAME
cp ../bin/pact-provider-verifier $STANDALONE_PACKAGE_NAME
mv $STANDALONE_PACKAGE_NAME $NPM_PACKAGE_NAME
cd $NPM_PACKAGE_NAME

tar -czf ../../dist/${NPM_PACKAGE_NAME}.tar.gz *