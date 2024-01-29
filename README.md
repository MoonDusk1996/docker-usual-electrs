
# Docker electrs server

For less advanced users who want to have their electrum server quickly and easily using docker container.
## Runing
Run: `curl -sSL https://raw.githubusercontent.com/MoonDusk1996/docker-usual-electrs/master/quick_start.sh | bash`

After finishing creating the docker image, check the configuration file at `/docker-usual-electrs/electrs_data` and upload your container by testing your configurations by running:

`docker run --rm -v <path_to_electrs_data>:/electrs electrs:latest`

Once you are sure your settings are correct, you can run:

`docker run -v <path_to_electrs_data>:/electrs -p 50001 -d electrs:latest`

You can add any directory to store the electrs database as long as you have an electrs.conf there.
