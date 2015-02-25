FROM cinova/erlang
MAINTAINER Cinova Dev <dev@cinova.co>
ENV MYSQLTMPROOT root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y upgrade
RUN echo mysql-server mysql-server/root_password password $MYSQLTMPROOT | \
    debconf-set-selections; \
    echo mysql-server mysql-server/root_password_again password $MYSQLTMPROOT | \
    debconf-set-selections; \
    apt-get install -y mysql-server mysql-client libmysqlclient-dev
CMD ["bash"]
