## Usage

```
docker create \
  --name hath \
  --net=host \
  -v /path/to/your/hath/cache:/hath/cache \
  -v /path/to/your/hath/data:/hath/data \
  -v /path/to/your/hath/download>:/hath/download \
  -v /path/to/your/hath/log:/hath/log \
  -v /path/to/your/hath/tmp:/hath/tmp \
  -e HATH_CLIENT_ID=YOUR_HATH_CLIENT_ID \
  -e HATH_CLIENT_KEY=YOUR_HATH_CLIENT_KEY \
  -e TZ=YOUR_TIMEZONE \
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

