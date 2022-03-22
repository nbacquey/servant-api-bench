#!/bin/bash
set -e

RESOLVER="lts-$2"
STACK_YAML="stack-$2.yaml"
DIR="flat-$1"
STACK="stack --stack-yaml=$STACK_YAML"
BUILD="$STACK build --ghc-options=\"-O2\""

cd $DIR
test -e $STACK_YAML
echo "benchmarking $DIR with resolver $RESOLVER"
mkdir -p ../results/flat-$1
$BUILD --only-dependencies
bench -o ../results/flat-$1/$RESOLVER.html --before "$STACK clean" "$BUILD"
