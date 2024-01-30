# Docker usual electrs
A fork of [docker-electrs](https://github.com/getumbrel/docker-electrs) that uses [electrs](https://github.com/romanz/electrs) to create a [Docker](https://www.docker.com/) container for an electrum server quickly and easily

## Runing
Run: 
```
curl -sSL https://raw.githubusercontent.com/MoonDusk1996/docker-usual-electrs/master/quick_start.sh | bash
```

After finishing creating the docker image, check the configuration file at `/docker-usual-electrs/electrs_data` and upload your container by testing your configurations by running:

```
docker run --rm -v <path_to_electrs_data>:/electrs electrs:latest
```

Once you are sure your settings are correct, you can run:

```
docker run -v <path_to_electrs_data>:/electrs -p 127.0.0.1:50001:50001 -d --name electrum-server electrs:latest
```
After this, your container will be running but it may take several hours to be completely synchronized with your node, you can see the status of the container running:

```
docker logs -f electrum-server
```

Note: You can add any directory to store the electrs database as long as you have an electrs.conf there.
