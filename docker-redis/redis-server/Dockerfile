FROM redis:alpine
 
COPY redis.conf /redis.conf
COPY run.sh /run.sh
 
CMD [ "/run.sh" ]
ENTRYPOINT [ "sh", "-c" ]
