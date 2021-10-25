#!/bin/bash

WORK_DIR=$(git rev-parse --show-toplevel)/build
CURRENT_DIR=$(pwd)
OUTPUT_DIR=$WORK_DIR/onnxruntime

if [[ -d $OUTPUT_DIR ]]; then
  rm -rf $OUTPUT_DIR
fi

if [[ ! -d $WORK_DIR ]]; then
  mkdir -p $WORK_DIR
fi

cd $WORK_DIR

ONNXRT_VER=1.9.1
ONNXRT_DIR=$WORK_DIR/onnxruntime-$ONNXRT_VER

if [[ ! -d $ONNXRT_DIR ]]; then
  git clone --single-branch -b v$ONNXRT_VER https://github.com/microsoft/onnxruntime $ONNXRT_DIR
fi

cd $ONNXRT_DIR

#./build.sh --config RelWithDebInfo --parallel --skip_tests --use_cuda --cuda_home /opt/cuda --cudnn_home /usr/  \
#--cmake_extra_defines onnxruntime_USE_MPI=ON onnxruntime_USE_PREINSTALLED_EIGEN=ON eigen_SOURCE_PATH=/usr/include/eigen3 CMAKE_CUDA_HOST_COMPILER=/usr/bin/clang CMAKE_CUDA_FLAGS="-D__is_signed=___is_signed" CMAKE_CUDA_ARCHITECTURES="52-real;compute_52;sm_52" onnxruntime_USE_CUDA=ON onnxruntime_CUDA_HOME=/opt/cuda onnxruntime_CUDNN_HOME=/usr onnxruntime_USE_NCCL=ON
CC=/usr/bin/clang CXX=/usr/bin/clang++ \
  cmake -S cmake --config RelWithDebInfo --parallel 12 --skip_tests \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -Donnxruntime_ENABLE_PYTHON=ON \
  -DONNX_CUSTOM_PROTOC_EXECUTABLE=/usr/bin/protoc \
  -Donnxruntime_PREFER_SYSTEM_LIB=ON \
  -Donnxruntime_USE_FULL_PROTOBUF=OFF \
  -Donnxruntime_BUILD_SHARED_LIB=ON \
  -Donnxruntime_ENABLE_TRAINING=ON \
  -Donnxruntime_USE_MPI=ON \
  -Donnxruntime_USE_PREINSTALLED_EIGEN=ON \
  -Deigen_SOURCE_PATH=/usr/include/eigen3 \
  -DCMAKE_CUDA_HOST_COMPILER=/usr/bin/clang \
  -DCMAKE_CUDA_FLAGS="-D__is_signed=___is_signed" \
  -DCMAKE_CUDA_ARCHITECTURES="$_CUDA_ARCHITECTURES" \
  -Donnxruntime_USE_CUDA=ON \
  -Donnxruntime_CUDA_HOME=/opt/cuda \
  -Donnxruntime_CUDNN_HOME=/usr \
  -Donnxruntime_USE_NCCL=ON

cd build/Linux/RelWithDebInfo

cmake $WORK_DIR/onnxruntime-$ONNXRT_VER/cmake -DCMAKE_INSTALL_PREFIX=$OUTPUT_DIR &&
  cmake --build . --target install

mkdir -p $OUTPUT_DIR/lib
for f in $(find . -name "lib*.a"); do
  cp $f $OUTPUT_DIR/lib
done

cd $CURRENT_DIR
