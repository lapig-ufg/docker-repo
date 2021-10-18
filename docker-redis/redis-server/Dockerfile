FROM redis:alpine

MAINTAINER Renato Gomes renatogomessilverio@gmail.com

COPY redis.conf /redis.conf
COPY run.sh /run.sh
 
CMD [ "/run.sh" ]
ENTRYPOINT [ "sh", "-c" ]
