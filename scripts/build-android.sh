#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

BUILD_DIR="$SCRIPT_DIR/../platform-build"
mkdir $BUILD_DIR
cd $BUILD_DIR

JNI_DIR=jniLibs
mkdir -p $JNI_DIR

UNAME=$(uname)

if [ "$UNAME" == "Darwin" ]; then
    NDK_HOME="$HOME/Library/Android/sdk/ndk"
elif [ "$UNAME" == "Linux" ]; then
    NDK_HOME="$HOME/Android/Sdk/ndk/"
fi

ANDROID_NDK=$( find "$NDK_HOME" -maxdepth 1 -type d | sort -V | tail -1 )

for ABI in arm64-v8a x86_64; do
    CMAKE_BUILD_DIR=build/android/$ABI

    cmake -H`pwd`/../third-party/ctq -B$CMAKE_BUILD_DIR \
        -DANDROID_ABI=$ABI \
        -DANDROID_PLATFORM=android-26 \
        -DANDROID_NDK=$ANDROID_NDK \
        -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_TESTING=OFF \
        -DBUILD_CTQ_WRITER=OFF \
        -DBUILD_CTQ_READER=ON \
        -DBUILD_CTQ_CLI=OFF \
        -GNinja

    cmake --build $CMAKE_BUILD_DIR --config Release --target ctq

    mkdir -p $JNI_DIR/$ABI
    cp $CMAKE_BUILD_DIR/libctq.so $JNI_DIR/$ABI
done

cd $JNI_DIR
tar -czvf ../android.tar.gz *
cd -

cp ./android.tar.gz ../packages/flutter_ctq/android/ctq.tar.gz

# Cleanup
rm -rf $JNI_DIR