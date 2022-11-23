# Step-by-step instruction on server
1. mkdir /opt/postgres_exporter
2. cd /opt/postgres_exporter
3. wget https://github.com/prometheus-community/postgres_exporter/releases/download/v0.10.0/postgres_exporter-0.10.0.linux-amd64.tar.gz
	cp /home/oburiatov/postgres_exporter-0.10.0.linux-amd64.tar.gz .
4. tar -xzvf postgres_exporter-0.10.0.linux-amd64.tar.gz
5. cd postgres_exporter-0.10.0.linux-amd64
6. sudo cp postgres_exporter /usr/local/bin
7. sudo useradd -rs /bin/false postgres
8. cp ./postgres_exporter.service /etc/systemd/system/postgres_exporter.service
9. cp ./postgres_exporter.env /opt/postgres_exporter/postgres_exporter.env
10.
	sudo systemctl daemon-reload </br>
	sudo systemctl start postgres_exporter </br>
	sudo systemctl enable postgres_exporter </br>
	sudo systemctl status postgres_exporter </br>
# Step-by-step instruction on Prometheus
1. vim ./config/prometheus.yml
``` 
  - job_name: 'postgres_exporter' 
  # scarpe_interval: 5s 
    static_configs: 
      - targets:
        - 'example.com:9087'
```