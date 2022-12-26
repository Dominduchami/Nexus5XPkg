#!/bin/bash

stuart_setup -c Platforms/Nexus6PPkg/PlatformBuild.py TOOL_CHAIN_TAG=CLANG38
stuart_update -c Platforms/Nexus6PPkg/PlatformBuild.py TOOL_CHAIN_TAG=CLANG38
stuart_build -c Platforms/Nexus6PPkg/PlatformBuild.py TOOL_CHAIN_TAG=CLANG38