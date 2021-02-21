#!/bin/bash

DEEPSTREAM_DIR=/opt/nvidia/deepstream/deepstream-5.0/

echo "Start to install models under ${DEEPSTREAM_DIR}"

echo "Download car detection <INT8> model..."
mkdir -p ${DEEPSTREAM_DIR}/samples/models/tlt_pretrained_models/trafficcamnet
cd ${DEEPSTREAM_DIR}/samples/models/tlt_pretrained_models/trafficcamnet
wget -qnv --show-progress https://api.ngc.nvidia.com/v2/models/nvidia/tlt_trafficcamnet/versions/pruned_v1.0/files/trafficnet_int8.txt
wget -qnv --show-progress https://api.ngc.nvidia.com/v2/models/nvidia/tlt_trafficcamnet/versions/pruned_v1.0/files/resnet18_trafficcamnet_pruned.etlt
echo

echo "Download LPR <INT8> model..."
mkdir -p ${DEEPSTREAM_DIR}/samples/models/LP/LPD
cd ${DEEPSTREAM_DIR}/samples/models/LP/LPD
wget -qnv --show-progress https://api.ngc.nvidia.com/v2/models/nvidia/tlt_lpdnet/versions/pruned_v1.0/files/usa_pruned.etlt
wget -qnv --show-progress https://api.ngc.nvidia.com/v2/models/nvidia/tlt_lpdnet/versions/pruned_v1.0/files/usa_lpd_cal.bin
wget -qnv --show-progress https://api.ngc.nvidia.com/v2/models/nvidia/tlt_lpdnet/versions/pruned_v1.0/files/usa_lpd_label.txt
echo

echo "Download LPR <FP16> model..."
mkdir -p ${DEEPSTREAM_DIR}/samples/models/LP/LPR
cd ${DEEPSTREAM_DIR}/samples/models/LP/LPR
wget -qnv --show-progress https://api.ngc.nvidia.com/v2/models/nvidia/tlt_lprnet/versions/deployable_v1.0/files/us_lprnet_baseline18_deployable.etlt
echo

echo "Create a dummy US licence plate label file..."
echo > labels_us.txt
echo "All Done!"; echo

