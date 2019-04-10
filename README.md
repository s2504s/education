# education

* Run environment:
```
cd education
docker-compose up -d
```

* If something went wrong. Be careful! All your created rules will be wiped:
```
docker-compose down
```

* Get a shell on the host1:
```
docker-compose exec host1 bash
```

* Leave the shell on the host1:
```
press ctrl+D
```

* Create a first rule:
```
docker-compose exec host1 bash
iptables -A INPUT -s 8.8.8.8 -j ACCEPT
```

* Check the rules
```
curl 172.26.2.128:10003
172.26.3.128
```

