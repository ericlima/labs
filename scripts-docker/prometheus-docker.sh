# docker run -d --name prometheus-server -p 9090:9090 -v /home/mccdev/prometheus/prometheus/prometheus.yml:/prometheus.yml prom/prometheus --config.file=/prometheus.yml
docker pull prom/prometheus
# -v /home/egvlima/lab-bigdata/prometheus.yml:/prometheus.yml --config.file=/prometheus.yml
# -v /home/egvlima/lab-bigdata/prometheus:/prometheus 

docker container stop alertmanager && docker container rm alertmanager

docker container stop prometheus-server && docker container rm prometheus-server

docker run --hostname alertmanager --name alertmanager -d --restart unless-stopped -p 9093:9093 --ip 10.2.0.3 -v /home/egvlima/projetos/lab-bigdata/prometheus:/config quay.io/prometheus/alertmanager --config.file=/config/alertmanagersimple.yml

docker run -d --restart unless-stopped --hostname prometheus-server --name prometheus-server -p 9090:9090 --ip 10.2.0.4 -v /home/egvlima/projetos/lab-bigdata/prometheus:/config prom/prometheus --config.file=/config/prometheus.yml