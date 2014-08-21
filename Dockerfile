# Mirror one S3 bucket to another S3 bucket.
# tip @cobbzilla for his work at https://www.gittip.com/cobbzilla/

FROM ubuntu:trusty

MAINTAINER Panagiotis Moustafellos <pmoust@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y openjdk-6-jre git && \
    git clone https://github.com/cobbzilla/s3s3mirror.git /opt/s3s3mirror

ENTRYPOINT ["/opt/s3s3mirror/s3s3mirror.sh"]
