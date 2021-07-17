# mediawiki-ez-docker

A simple mediawiki docker container that needs minimal effort to setup, and just works. Runs mariadb and apache in the same container, and is made to require minimal effort to setup and backup.

## Usage
1. Clone this repo `git clone git@github.com:pranavgade20/mediawiki-ez-docker.git`
1. `cd mediawiki-ez-docker && docker build --tag wiki .`
1. `docker run --rm --name my-wiki -p 8080:80 -d wiki`
1. Go to http://localhost:8080/mediawiki , and configure the wiki. The database user is `wiki_user`, and password is `super_safe_passwd`. You can change this in docker-setup.sh before building the container.
1. Download the generated LocalSettings.php file
1. stop the container, and re-run it with the downloaded LocalSettings.php mounted to `/var/lib/mediawiki/`
1. You should back up the container regularly. see https://www.geeksforgeeks.org/backing-up-a-docker-container/ and https://docs.docker.com/desktop/backup-and-restore/
1. Additionally, you can get ssl certificates for https connections. See https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-18-04
