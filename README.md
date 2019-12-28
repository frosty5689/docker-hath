[hub]: https://hub.docker.com/r/frosty5689/hath/

# frosty5689/hath
[![](https://images.microbadger.com/badges/version/frosty5689/hath.svg)](https://microbadger.com/images/frosty5689/hath "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/frosty5689/hath.svg)](https://microbadger.com/images/frosty5689/hath "Get your own image badge on microbadger.com")[![Docker Pulls](https://img.shields.io/docker/pulls/frosty5689/hath.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/frosty5689/hath.svg)][hub]

## Usage

```
docker run \
  --name hath \
  --user 99:100 \
  -v /path/to/your/hath/cache:/hath/cache \
  -v /path/to/your/hath/data:/hath/data \
  -v /path/to/your/hath/download>:/hath/download \
  -v /path/to/your/hath/log:/hath/log \
  -v /path/to/your/hath/tmp:/hath/tmp \
  -e HATH_CLIENT_ID=YOUR_HATH_CLIENT_ID \
  -e HATH_CLIENT_KEY=YOUR_HATH_CLIENT_KEY \
  -e UMASK=000 \
  -e TZ=YOUR_TIMEZONE \
  -p YOUR_HATH_PORT/tcp \
  frosty5689/hath
```

Or if bridge mode doesn't work on your Docker host for some reason...

```
docker run \
  --name hath \
  --net=host \
  --user 99:100 \
  -v /path/to/your/hath/cache:/hath/cache \
  -v /path/to/your/hath/data:/hath/data \
  -v /path/to/your/hath/download>:/hath/download \
  -v /path/to/your/hath/log:/hath/log \
  -v /path/to/your/hath/tmp:/hath/tmp \
  -e HATH_CLIENT_ID=YOUR_HATH_CLIENT_ID \
  -e HATH_CLIENT_KEY=YOUR_HATH_CLIENT_KEY \
  -e UMASK=000 \
  -e TZ=YOUR_TIMEZONE \
  frosty5689/hath
```

## Parameters

* `--net=host` - Uses host network with container, use this if H@H have trouble accepting connections. This will let H@H use the host's internal IP for routing instead of the internal IP used by Docker bridge.
* `--user 99:100` - Replace the UID and GID with the user and group you want H@H to run as. This will affect the file ownership of the cache and downloads
* `-v /hath/cache` - H@H cache
* `-v /hath/data` - H@H data
* `-v /hath/download` - H@H download
* `-v /hath/log` - H@H log
* `-v /hath/tmp` - H@H tmp
* `-e HATH_CLIENT_ID` - H@H Client ID
* `-e HATH_CLIENT_KEY` - H@H Client Key
* `-e UMASK` - This overrides the default umask of 022 which lets all users access the directory and files, but only let the owner modify it. If you set it to 000, then all users will be read and write files created by H@H.
* `-e TZ` - Timezone H@H will run in
* `-p YOUR_HATH_PORT/tcp` - The port used by H@H as set in the configuration page. The container port should match the host port.

