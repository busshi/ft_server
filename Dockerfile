# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aldubar <aldubar@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/14 11:01:51 by aldubar           #+#    #+#              #
#    Updated: 2020/12/17 22:01:55 by aldubar          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y apt-utils && apt-get install -y nginx mariadb-server php php-fpm php-mysql php-mbstring openssl libnss3-tools

COPY srcs/ ./root/

WORKDIR /root/

EXPOSE 80 443

ENTRYPOINT ["bash", "entry_point.sh"]
