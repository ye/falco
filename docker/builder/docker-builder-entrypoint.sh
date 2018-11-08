#!/bin/bash
set -exo pipefail

if [[ -z $MAKE_JOBS ]]; then
  MAKE_JOBS=1
fi

if [[ -z $BUIILD_TYPE ]]; then
    BUILD_TYPE=Release
fi

export BUILD_DRIVER=OFF

run_cmake()
{
    mkdir -p /builds/falco/$BUILD_TYPE
    cd /builds/falco/$BUILD_TYPE
    scl enable devtoolset-6 "cmake3 -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DBUILD_DRIVER=${BUILD_DRIVER} /code/falco"
}    

build_binaries()
{
    cd /builds/falco/$BUILD_TYPE
    scl enable devtoolset-6 "make -j$MAKE_JOBS"
}

build_package()
{
    cd /builds/falco/$BUILD_TYPE    

    scl enable devtoolset-6 "make -j$MAKE_JOBS package"
}

case "$1" in
	bash)
		bash
		;;
	cmake)
	        run_cmake
		;;
	build)
		build_binaries
		;;
	package)
		build_package
		;;
esac
