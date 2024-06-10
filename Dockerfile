FROM debian:buster-slim@sha256:a7c825a81b4c09e0675ef834b6799fa7b7d1f82d6afd12a16be7d46440fe15cb
RUN apt update
RUN apt install -y \
    curl \
    gnupg \
    ca-certificates \
    zlib1g-dev \
    libjpeg-dev \
    nano
RUN echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" | tee /etc/apt/sources.list.d/coral-edgetpu.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN apt update
RUN apt install libedgetpu1-std python3 python3-pip -y
RUN apt update
RUN pip3 install --no-cache-dir https://github.com/google-coral/pycoral/releases/download/v2.0.0/tflite_runtime-2.5.0.post1-cp37-cp37m-linux_aarch64.whl
RUN apt update
RUN apt install python3-pycoral -y
RUN mkdir coral
RUN mkdir coral/pycoral
WORKDIR coral/pycoral
COPY pycoral/ .  
RUN bash examples/install_requirements.sh
