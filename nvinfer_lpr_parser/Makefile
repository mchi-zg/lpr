################################################################################
# Copyright (c) 2020, NVIDIA CORPORATION. All rights reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.
################################################################################
CC:= g++

NVDS_VERSION:=5.0

CFLAGS:= -Wall -Werror -std=c++11 -shared -fPIC -Wno-error=deprecated-declarations

CFLAGS+= -I/opt/nvidia/deepstream/deepstream-$(NVDS_VERSION)/sources/includes

LIBS:= -lnvinfer -lnvparsers
LFLAGS:= -Wl,--start-group $(LIBS) -Wl,--end-group

SRCFILES:= nvinfer_custom_lpr_parser.cpp
TARGET_LIB:= libnvdsinfer_custom_impl_lpr.so

all: $(TARGET_LIB)

$(TARGET_LIB) : $(SRCFILES)
	@$(CC) -o $@ $^ $(CFLAGS) $(LFLAGS)
	cp $@ /opt/nvidia/deepstream/deepstream-5.0/lib/

clean:
	@rm -rf $(TARGET_LIB)
	rm -f /opt/nvidia/deepstream/deepstream-5.0/lib/$(TARGET_LIB)
