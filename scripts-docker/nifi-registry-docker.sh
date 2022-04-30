/opt/nifi-registry/nifi-registry-current/flow_storage


docker run --name nifi-registry \
  -p 19090:19090 \
  -d \
  -e NIFI_REGISTRY_WEB_HTTP_PORT='19090' \
  apache/nifi-registry:latest
