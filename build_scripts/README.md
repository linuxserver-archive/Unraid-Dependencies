![https://linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)

## Uploading

Set up an s3cmd docker container with the following:

```
docker create \
  --name=s3cmd \
  -v /mnt/disk1/appdata/s3cmd:/config \
  -v /mnt:/mnt:ro \
  -e TZ=Europe/London \
  aptalca/docker-s3cmd
```

Initial setup: 
`docker exec -it s3cmd s3cmd --configure`

* Enter the access key and the secret key
* Set region to `UK`
* Endpoint will be `ams3.digitaloceanspaces.com`
* DNS-based bucket will be `%(bucket)s.ams3.digitaloceanspaces.com`
* Rest can be left as default (hit enter)
* It should test connection and if successful, hit yes to save config
* The config file will be in the `/config` folder

Leave the container running while the build scripts run
