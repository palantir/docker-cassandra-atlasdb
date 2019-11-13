FROM cassandra:3.11

RUN apt-get update && apt-get install -y curl
RUN curl -Lk https://bintray.com/palantir/releases/download_file?file_path=com%2Fpalantir%2Fcassandra%2Fpalantir-cassandra%2F3.11.4-pt-2.0.0-rc7%2Fpalantir-cassandra-3.11.4-pt-2.0.0-rc7.tgz | tar -zxv
ENV PATH palantir-cassandra-3.11.4-pt-2.0.0-rc7/bin:$PATH

ENV _JAVA_OPTIONS=-Dcassandra.skip_wait_for_gossip_to_settle=0
ENV CASSANDRA_COMMAND cassandra
ENV CASSANDRA_CONFIG palantir-cassandra-3.11.4-pt-2.0.0-rc7/conf/
ENV CASSANDRA_YAML $CASSANDRA_CONFIG/cassandra.yaml
ENV CASSANDRA_ENV $CASSANDRA_CONFIG/cassandra-env.sh

COPY cassandra.yaml $CASSANDRA_YAML
COPY cassandra-env.sh $CASSANDRA_ENV
COPY entrypoint.sh /entrypoint.sh

EXPOSE 7000 7001 7199 9042 9160

ENTRYPOINT ["/entrypoint.sh"]
CMD ["cassandra", "-f"]
