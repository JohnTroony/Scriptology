# Install ELK on Ubuntu Server 14.04

## Install Java

```bash
sudo apt-get install software-properties-common
sudo apt-get install python3-software-properties
sudo apt-get install python-software-properties

sudo add-apt-repositoty -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
```


## Install ElasticSearch

```bash
wget -qO https://package.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

echo "deb https://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list

sudo apt-get update
sudo apt-get install elasticsearch
sudo service elasticsearch restart
sudo update-rc.d elasticsearch defaults 95 10
```

### Check response:

```bash
curl -X GET http://localhost:9200
```

## Install Logstash

```bash
echo "deb http://packages.elastic.co/logstash/2.3/debian stable main" | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get install logstash
sudo service logstash restart
sudo update-rc.d logstash defaults 96 9
```

## Install Kibana (version 4.5)

```bash
# Method 1
sudo apt-get install apache2 -y
sudo service apache2 restart
sudo apt-get update
sudo wget https://download.elastic.co/kibana/kibana/kibana-4.5.0-linux-x64.tar.gz
sudo mkdir -p /var/www/kibana

# Method 2
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

echo "deb http://packages.elastic.co/kibana/4.5/debaian stable main" | sudo echo "deb http://packages.elastic.co/kibana/4.5/debian stable main" | sudo tee -a /etc/apt/sources.list

sudo apt-get update
sudo apt-get install kibana
sudo service kibana start
sudo update-rc.d kibana defaults 96 9
```

### Copy Folder and Rename Kibana folder to Webserver

```bash
sudo cp -R ~/kibana-4.5.0-linux-x64/* /var/www/kibana/
```

## Configure Kibana Webserver

```bash
sudo vim /etc/apache2/conf-enabled/kibana.conf

# Add the following:
	
	alias /kibana /var/www/kibana
	
	<Directory /var/www/kibana>
		order allow,deny
		allow from all
	</Directory>

sudo service apache2 restart 

````

## Head over http://localost:5601/app/Kibana

