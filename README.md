# Docker usual electrs
The intuition of this repository is to make it possible for anyone to have their own [Electrum](https://github.com/spesmilo/electrum) server, using [Electrs](https://github.com/romanz/electrs) and [Docker](https://www.docker.com/) the easy way

## Quick introduction
An Electrum wallet generally connects to a public server linked to a Bitcoin node to perform actions on the network.
With your own electrum server connected to your own node, you become completely self-sovereign over your actions on the bitcoin network.

## You need to have
- [Bitcoin-node](https://github.com/bitcoin/bitcoin)
- [Docker](https://www.docker.com/)
- [Git](https://git-scm.com/)

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
