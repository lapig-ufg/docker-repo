FROM tomcat:8.5-jdk8

ENV GN_FILE geonetwork.war
ENV DATA_DIR=$CATALINA_HOME/webapps/geonetwork/WEB-INF/data
ENV JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -server -Xms512m -Xmx2024m -XX:NewSize=512m -XX:MaxNewSize=1024m -XX:+UseConcMarkSweepGC"

#Environment variables
ENV GN_VERSION 3.10.8
ENV GN_DOWNLOAD_MD5 2020a866c0100ef0c2f3312ab7232918

WORKDIR $CATALINA_HOME/webapps

RUN curl -fSL -o $GN_FILE \
     https://sourceforge.net/projects/geonetwork/files/GeoNetwork_opensource/v${GN_VERSION}/${GN_FILE}/download && \
     echo "$GN_DOWNLOAD_MD5 *${GN_FILE}" | md5sum -c && \
     mkdir -p geonetwork && \
     unzip -e $GN_FILE -d geonetwork && \
     rm $GN_FILE

RUN apt-get update && apt-get install -y --no-install-recommends postgresql-client && \
    rm -rf /var/lib/apt/lists/*

#Set PostgreSQL as default GN DB
RUN sed -i -e 's#<import resource="../config-db/${geonetwork.db.type:h2}.xml"/>#<!--<import resource="../config-db/${geonetwork.db.type:h2}.xml"/-->#g' "${CATALINA_HOME}/webapps/geonetwork/WEB-INF/config-node/srv.xml" && \
sed -i -e 's#<!--<import resource="../config-db/postgres.xml"/>-->#<import resource="../config-db/postgres.xml"/>#g' "${CATALINA_HOME}/webapps/geonetwork/WEB-INF/config-node/srv.xml"

COPY ./config/jdbc.properties $CATALINA_HOME/webapps/geonetwork/WEB-INF/config-db/jdbc.properties

#Set geonetwork data dir
COPY ./config/docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["catalina.sh", "run"]
