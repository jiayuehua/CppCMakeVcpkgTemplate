FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu24.04

ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="3.22.2"

# Optionally install the cmake for vcpkg
COPY ./reinstall-cmake.sh /tmp/

RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
        chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
    fi \
    && rm -f /tmp/reinstall-cmake.sh

# [Optional] Uncomment this section to install additional vcpkg ports.
# RUN su vscode -c "${VCPKG_ROOT}/vcpkg install <your-port-name-here>"

# [Optional] Uncomment this section to install additional packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        gettext \
        libgtk-3-dev \
        libcurl4-openssl-dev \
        libtool \
        automake \
        autoconf \
        autotools-dev \
        language-pack-en \
        python3.10 \
        liblzma-dev \
        libicu-dev \
        libsqlite3-dev \
        qt6-base-dev \
        libsdl2-mixer-dev \
        libsdl2-gfx-dev \
        libsdl2-image-dev \
        libsdl2-ttf-dev \
        libmysqlclient-dev \
        xauth x11-apps