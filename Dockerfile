FROM jenkins/jenkins:lts

ENV "http_proxy"="http://172.17.0.1:3128" \
    "https_proxy"="http://172.17.0.1:3128" \
    "no_proxy"="localhost,.hwap,.abc.com" \
    "HTTP_PROXY"="http://172.17.0.1:3128" \
    "HTTPS_PROXY"="http://172.17.0.1:3128" \
    "NO_PROXY"="localhost,.hwap,.abc.com" \
    "ANDROID_NDK_HOME"="/opt/android-ndk" \
    "ANDROID_NDK_VERSION"="r17b"



USER root

COPY docker/apt-proxy /etc/apt/apt.conf.d/30proxy
COPY docker/abc_proxy_certificate.crt \
    /usr/local/share/ca-certificates/abc_proxy_certificates.crt

RUN apt-get update && apt-get install -y ca-certificates \
                                         cmake \
                                        build-essential

RUN mkdir /opt/android-ndk-tmp && \
    cd /opt/android-ndk-tmp && \
    wget -q https://dl.google.com/android/repository/android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip && \
# uncompress
    unzip -q android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip && \
# move to its final location
    mv ./android-ndk-${ANDROID_NDK_VERSION} ${ANDROID_NDK_HOME} && \
# remove temp dir
    cd ${ANDROID_NDK_HOME} && \
    rm -rf /opt/android-ndk-tmp

# add to PATH
ENV "PATH"="${PATH}:${ANDROID_NDK_HOME}" \
    "NDK"="${ANDROID_NDK}" \
    "JAVA_OPTS"="-Dhttp.proxyHost=172.17.0.1 -Dhttp.proxyPort=3128 -Dhttps.proxyHost=172.17.0.1 -Dhttps.proxyPort=3128"

RUN usermod -g games jenkins
RUN mkdir /var/jenkins_home/workspace
USER jenkins
