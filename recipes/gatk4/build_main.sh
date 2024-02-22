#!/bin/bash

BINARY_HOME=$PREFIX/bin
PACKAGE_HOME=$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM

mkdir -p $PREFIX/bin
mkdir -p $PACKAGE_HOME

git clone https://github.com/broadinstitute/gatk.git gatk-${PKG_VERSION}
cd gatk-${PKG_VERSION}
git lfs install
git lfs pull --include src/main/resources/large

chmod +x gatk
cp gatk ${PACKAGE_HOME}/gatk
./gradlew localJar
cp gatk-*-local.jar $PACKAGE_HOME
cd src/main/python/org/broadinstitute/hellbender/

python setup_gcnvkernel.py install
python setup.py install
# Does not install the spark jars, this is done in the `build_spark.sh`

ln -s $PACKAGE_HOME/gatk $PREFIX/bin
