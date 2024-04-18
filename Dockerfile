FROM arm64v8/ubuntu:20.04

# 安装必要的依赖和交叉编译工具链
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    liblzma-dev \
    libffi-dev \
    libbz2-dev \
    libexpat1-dev \
    llvm \
    libclang-dev \
    android-sdk \
    openjdk-11-jdk

# 设置环境变量
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-arm64
ENV PATH $JAVA_HOME/bin:$PATH

# 安装 Android NDK
RUN wget https://dl.google.com/android/repository/android-ndk-r24-linux-arm64.zip && \
    sudo unzip android-ndk-r24-linux-arm64.zip -d /usr/local && \
    rm android-ndk-r24-linux-arm64.zip

# 设置 NDK_HOME 和 LD_LIBRARY_PATH
ENV ANDROID_NDK_HOME /usr/local/android-ndk-r24
ENV LD_LIBRARY_PATH $ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/lib64:$LD_LIBRARY_PATH
