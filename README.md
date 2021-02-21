- [Description](#description)
- [Performance](#performance)
- [Prerequisites](#prerequisites)
- [Download](#download)
  * [1. Download Project with SSH or HTTPS](#1-download-project-with-ssh-or-https)
  * [2. Prepare Models and TensorRT engine](#2-prepare-models-and-tensorrt-engine)
- [Build and Run](#build-and-run)

## Description

This DeepStream sample is to show using graded models in below pipeline for car plate characters recognition with DeepStream SDK 5.0.1. 

```
Multiple local videos -> nvstreammux -> PGIE(car detection model) -> SGIE(LPD model) -> SGIE(LPR model)
```

This pipeline is based on three TLT models

* Car detection model

* LPD(Car License Plate Detection) model

* LPR(car License Plate Recognition) model

More details about these TLT3.0 LPD and LPR models and their TLT training, please refer to [APLR blog](https://docs.google.com/document/d/1tMH0ku284AqqcVdioS1XazyT0-uGNNpg4-r64JaIBZA/edit#).

## Performance

Below is end-to-end performance of this sample with an 1080p video.

| Device        | Number of streams    |       Batch Size      |       Total FPS       |
| ------------- | -------------------- | --------------------  | --------------------  |
| Jetson Nano   | 1                    | 1                     | 9                     |
| Jetson NX     | 3                    | 3                     | 80                    |
| Jetson Xavier | 5                    | 5                     | 146                   |
| T4            | 14                   | 14                    | 447                   |

## Prerequisites

* [Deepstream SDK 5.0.1](https://developer.nvidia.com/deepstream-sdk)  
   Make sure deepstream-test1 sample can run successful to verify your DeepStream installation
* tlt-converter  
   Download x86 or Jetson tlt-converter from https://developer.nvidia.com/tlt-getting-started

## Download
### 1. Download Project with SSH or HTTPS

```
// SSH
git clone git@github.com:mchi-zg/deepstream_lpr_app.git
// or HTTPS
git clone https://github.com/mchi-zg/deepstream_lpr_app.git
```

### 2. Prepare Models and TensorRT engine

```
cd deepstream_lpr_app
./download.sh
// DS5.0.1 gst-nvinfer cannot generate TRT engine for LPR model, so generate it with tlt-converter
./tlt-converter -k nvidia_tlt -p image_input,1x3x48x96,4x3x48x96,16x3x48x96 \
           ./us_lprnet_baseline18_deployable.etlt -t fp16 -e lpr_us_onnx_b16.engine
```

## Build and Run

```
make
./lpr-app [language mode:1-us 2-chinese] \ 
               [sink mode:1-output as 264 stream file 2-no output 3-display on screen] \ 
               [0:ROI disable|0:ROI enable] [input mp4 file path and name] \ 
               [input mp4 file path and name] ... [input mp4 file path and name] \
               [output 264 file path and name]
```
