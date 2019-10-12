FROM ubuntu:14.04

RUN groupadd -r redis && useradd -r -g redis redis 
############################################
ENV REDIS_VERSION 5.0.4
ENV REDIS_DOWNLOAD_URL http://download.redis.io/releases/redis-5.0.4.tar.gz
ENV REDIS_DOWNLOAD_SHA 3ce9ceff5a23f60913e1573f6dfcd4aa53b42d4a2789e28fa53ec2bd28c987dd

# for redis-sentinel see: http://redis.io/topics/sentinel
RUN set -ex; \
	\
	buildDeps=' \
		ca-certificates \
		wget \
		\
		gcc \
		libc6-dev \
		make \
	'; \
	apt-get update; \
	apt-get install -y $buildDeps --no-install-recommends; \
	rm -rf /var/lib/apt/lists/*; \
	\
	wget -O redis.tar.gz "$REDIS_DOWNLOAD_URL"; \
	echo "$REDIS_DOWNLOAD_SHA *redis.tar.gz" | sha256sum -c -; \
	mkdir -p /usr/src/redis; \
	tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1; \
	rm redis.tar.gz; \
	\
# disable Redis protected mode [1] as it is unnecessary in context of Docker
# (ports are not automatically exposed when running inside Docker, but rather explicitly by specifying -p / -P)
# [1]: https://github.com/antirez/redis/commit/edd4d555df57dc84265fdfb4ef59a4678832f6da
	grep -q '^#define CONFIG_DEFAULT_PROTECTED_MODE 1$' /usr/src/redis/src/server.h; \
	sed -ri 's!^(#define CONFIG_DEFAULT_PROTECTED_MODE) 1$!\1 0!' /usr/src/redis/src/server.h; \
	grep -q '^#define CONFIG_DEFAULT_PROTECTED_MODE 0$' /usr/src/redis/src/server.h; \
# for future reference, we modify this directly in the source instead of just supplying a default configuration flag because apparently "if you specify any argument to redis-server, [it assumes] you are going to specify everything"
# see also https://github.com/docker-library/redis/issues/4#issuecomment-50780840
# (more exactly, this makes sure the default behavior of "save on SIGTERM" stays functional by default)
	\
	make -C /usr/src/redis -j "$(nproc)"; \
	make -C /usr/src/redis install; \
	\
	rm -r /usr/src/redis; \
	\
	apt-get purge -y --auto-remove $buildDeps

VOLUME /data
############################################

RUN apt-get -y update \
    #&& apt-get -y install python3-pip \
    #&& pip3 install pyinstaller \
    && apt-get -y install wget build-essential bison autoconf \
    && mkdir /usr/local/src/bash \
    && wget -qO- http://labfile.oss.aliyuncs.com/bash-4.1.tar.gz | tar zx -C /usr/local/src/bash --strip-components=1 \
    && cd /usr/local/src/bash \
    && ./configure \
    && make \
    && make install \
    && rm -rf /usr/local/src/bash \
    && rm /bin/bash \
    && ln -s /usr/local/bin/bash /bin/bash \
    && ln -sf /bin/bash /bin/sh
############################################
RUN apt-get -y update; \
    apt-get -y install php5; \
    apt-get install -y gosu; apt-get -y install vim;\
    apt-get install -y openssh-server;\
    apt-get install -y net-tools;rm -rf /var/lib/apt/lists/*

RUN echo "root:943659629" | chpasswd;useradd -s /bin/bash test && echo "test:123" | chpasswd;
WORKDIR /home/test
COPY ./flag.txt /root/flag.txt
COPY ./demo.php /home/test/getpasswd.php
COPY ./main.php /home/test/main.php
COPY ./flagSet.sh /usr/local/bin/
RUN  chmod u+x /usr/local/bin/flagSet.sh

EXPOSE 6379
CMD ["121.248.54.212","6379","foobared","0","-1"]
ENTRYPOINT ["/usr/local/bin/flagSet.sh"]

