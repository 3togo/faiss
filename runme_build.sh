#! /bin/bash
do_cmd(){
	echo #@
	$@
	[[ $? -ne 0 ]] && echo "do_cmd failed" && exit
}
do_cmd cmake -DCMAKE_CUDA_COMPILER=/usr/local/cuda-12.4/bin/nvcc -DCMAKE_CXX_COMPILER=/usr/bin/g++-13 -DBUILD_SHARED_LIBS=ON -B build .
do_cmd make -C build -j$(nproc) faiss
do_cmd make -C build -j$(nproc) swigfaiss

do_cmd cd build/faiss/python
do_cmd python setup.py install
do_cmd sudo make -C build install
