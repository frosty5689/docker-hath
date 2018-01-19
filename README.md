## Usage

```
docker create \
  --name hath \
  --net=host \
  -e HATH_CLIENT_ID=<HATH_CLIENT_ID> \
  -e HATH_CLIENT_KEY=<HATH_CLIENT_KEY> \
  -e TZ=<TIMEZONE_TO_RUN_CONTAINER_IN> \
  -e PUID=<UID_CONTAINER_RUN_AS> \
  -e PGID=<GID_CONTAINER_RUN_AS> \
  -v </path/to/your/hath/cache>:/hath/cache \
  -v </path/to/your/hath/data>:/hath/data \
  -v </path/to/your/hath/download>:/hath/download \
  -v </path/to/your/hath/log>:/hath/log \
  -v </path/to/your/hath/tmp>:/hath/tmp \
  frosty5689/hath
```

## Parameters

* `--net=host` - Uses host network with container, *required*.
* `-v /hath/cache` - H@H cache
* `-v /hath/data` - H@H data
* `-v /hath/download` - H@H download
* `-v /hath/log` - H@H log
* `-v /hath/tmp` - H@H tmp
* `-e HATH_CLIENT_ID` - H@H Client ID
* `-e HATH_CLIENT_KEY` - H@H Client Key
* `-e TZ` - Timezone H@H will run in
* `-e PUID` - Override the User ID H@H will run as
* `-e PGID` - Override the Group ID H@H will run as

