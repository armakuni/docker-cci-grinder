FROM ruby:2.2.2

RUN apt-get update && apt-get install -y unzip wget && rm -rf /var/lib/apt/lists/*

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

ENV JAVA_VERSION 7u79
ENV JAVA_DEBIAN_VERSION 7u79-2.5.5-1~deb8u1

RUN apt-get update && apt-get install -y openjdk-7-jdk && rm -rf /var/lib/apt/lists/*

RUN wget -P /tmp/ http://central.maven.org/maven2/net/sf/grinder/grinder/3.11/grinder-3.11-binary.zip && \
    unzip /tmp/grinder-3.11-binary.zip -d /opt/ && \
    cd /opt && ln -s grinder-3.11 grinder

CMD bash
