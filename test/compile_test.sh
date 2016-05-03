#!/bin/sh

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

mktmpdir() {
  local dir=$(mktemp -t testXXXXX)
  rm -rf $dir
  mkdir $dir
  echo $dir
}

testCompile() {
  local env_dir=$(mktmpdir)
  echo "ImageMagick Version" > "$env_dir/IMAGEMAGICK_VERSION"
  compile $BUILD_DIR $CACHE_DIR $env_dir
  assertCapture "ImageMagick Version"
}

