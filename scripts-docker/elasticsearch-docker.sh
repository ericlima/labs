docker run -d --name elasticsearch --net mynet -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:7.4.0

