# Step-by-step instruction on server
1. mkdir /opt/node_exporter
2. cd /opt/node_exporter
3. wget https://github.com/prometheus/node_exporter/releases/download/v1.3.0/node_exporter-1.3.0.linux-amd64.tar.gz
	cp /home/oburiatov/node_exporter-1.3.0.linux-amd64.tar.gz .
4. tar -xzvf /opt/node_exporter/node_exporter-1.3.0.linux-amd64.tar.gz --directory /opt/node_exporter/
5. cd node_exporter-1.3.0.linux-amd64
6. sudo cp /opt/node_exporter/node_exporter-1.3.0.linux-amd64/node_exporter /usr/local/bin
7. sudo useradd -rs /bin/false node_exporter
8. chown node_exporter:node_exporter /usr/local/bin/node_exporter
9. cp ./node_exporter.service /etc/systemd/system/node_exporter.service
10.
	sudo systemctl daemon-reload </br>
	sudo systemctl start node_exporter

# Step-by-step instruction on Prometheus
1.docker exec -it prometheus vi /etc/prometheus/prometheus.yml

2. cd /grid/0/prometheus/config/prometheus.yml