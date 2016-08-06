FROM cassandra:2.2.7
MAINTAINER Palantir Technologies
ADD cassandra.yaml /etc/cassandra/cassandra.yaml
ENV _JAVA_OPTIONS=-Dcassandra.skip_wait_for_gossip_to_settle=0