#!/bin/bash

stuart_setup -c Platforms/HtcOneM9Pkg/PlatformBuild.py TOOL_CHAIN_TAG=CLANG38
stuart_update -c Platforms/HtcOneM9Pkg/PlatformBuild.py TOOL_CHAIN_TAG=CLANG38
stuart_build -c Platforms/HtcOneM9Pkg/PlatformBuild.py TOOL_CHAIN_TAG=CLANG38