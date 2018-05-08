FROM quay.io/pires/docker-elasticsearch:6.2.4

MAINTAINER pjpires@gmail.com

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV DISCOVERY_SERVICE elasticsearch-discovery

# Kubernetes requires swap is turned off, so memory lock is redundant
ENV MEMORY_LOCK false

# Install X-pack and remove machine learning plugin
# https://github.com/pires/kubernetes-elasticsearch-cluster/issues/102
ENV ES_TMPDIR="/tmp"
RUN NODE_NAME=local /elasticsearch/bin/elasticsearch-plugin install x-pack --batch && \
    rm -rf /elasticsearch/plugins/x-pack/x-pack-ml
