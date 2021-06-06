
#I used ffmpeg 3.3 version
# download and unzip it

sudo apt-get install -y \
    build-essential \
    checkinstall \
    git \
    libfaac-dev \
    libjack-jackd2-dev \
    libmp3lame-dev \
    libopencore-amrnb-dev \
    libopencore-amrwb-dev \
    libsdl1.2-dev libtheora-dev \
    libva-dev \
    libvdpau-dev \
    libvorbis-dev \
    libx11-dev \
    libxfixes-dev \
    libxvidcore-dev \
    texi2html \
    yasm \
    zlib1g-dev \
    libsdl1.2-dev \
    libvpx-dev \
    wget \
    libv4l-0

# go to FFmpeg-v3.3.3/FFmpeg-n3.3.3
# run the following command
 ./configure --enable-gpl --enable-libmp3lame --enable-libopencore-amrnb \
    --enable-libopencore-amrwb --enable-libtheora --enable-libvorbis --enable-libxvid \
    --enable-postproc --enable-version3 --enable-shared --enable-libvpx --enable-pic
make -j 8
make install
