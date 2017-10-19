FROM alpine:latest

MAINTAINER Micheal Du <duyizhaozj321@yahoo.com>

RUN buildDeps=" \
		build-base \
		cmake \
		svn \
		linux-headers \
		openssl-dev \
	"; \
	set -x \
	&& apk add --update openssl \
	&& apk add $buildDeps \
	&& mkdir -p /usr/src \
	&& cd /usr/src \
	&& svn co https://shop.ntop.org/svn/ntop/trunk/n2n \
	&& cd n2n/n2n_v2 \
	&& cmake . \
	&& make install \
	&& cd / \
	&& rm -fr /usr/src/n2n \
	&& apk del $buildDeps \
	&& rm -rf /var/cache/apk/*