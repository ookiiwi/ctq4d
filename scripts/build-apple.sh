#!/bin/bash

BUILD_DIR=platform-build
mkdir $BUILD_DIR
cd $BUILD_DIR

LIBNAME=libctq.a

for TARGET in OS64 SIMULATOR64 SIMULATORARM64; do
    IOS_BUILD_DIR=build/ios/$TARGET

    cmake -S`pwd`/../third-party/ctq -B$IOS_BUILD_DIR -GXcode \
        -DCMAKE_TOOLCHAIN_FILE=`pwd`/../third-party/ios-cmake/ios.toolchain.cmake \
        -DPLATFORM=$TARGET \
        -DENABLE_VISIBILITY=True \
        -DBUILD_TESTING=OFF \
        -DBUILD_CTQ_WRITER=OFF \
        -DBUILD_CTQ_READER=ON \
        -DBUILD_CTQ_CLI=OFF
    cmake --build $IOS_BUILD_DIR --config Release --target ctq

    IOS_DIR=ios-$TARGET-ar
    mkdir $IOS_DIR

    libtool -static -o $IOS_DIR/$LIBNAME  \
        $IOS_BUILD_DIR/Release-iphone*/$LIBNAME \
        $IOS_BUILD_DIR/third-party/lz4/build/cmake/Release-iphone*/liblz4.a
done

FRAMEWORK="Ctq.xcframework"
mkdir ios-sim-lipo
IOS_SIM_LIPO=ios-sim-lipo/$LIBNAME

lipo -create -output $IOS_SIM_LIPO \
    ios-SIMULATOR64-ar/$LIBNAME \
    ios-SIMULATORARM64-ar/$LIBNAME

xcodebuild -create-xcframework \
    -library $IOS_SIM_LIPO \
    -library ios-OS64-ar/$LIBNAME \
    -output $FRAMEWORK
zip -r $FRAMEWORK.zip $FRAMEWORK

# Cleanup
rm -rf ios-*-ar ios-sim-lipo $FRAMEWORK

mkdir -p `pwd`/../packages/flutter_ctq/ios/Frameworks/ && cp $FRAMEWORK.zip $_
cp -o "`pwd`/../third-party/ctq/include/ctq_reader.h" "`pwd`/../packages/flutter_ctq/ios/Classes/ctq_reader.h"
