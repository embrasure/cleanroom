# embrasure/cleanroom

[![CircleCI](https://circleci.com/gh/embrasure/cleanroom/tree/master.svg?style=svg)](https://circleci.com/gh/embrasure/cleanroom/tree/master) [![](https://imagelayers.io/badge/embrasure/cleanroom:latest.svg)](https://imagelayers.io/?images=embrasure/cleanroom:latest 'Get your own badge on imagelayers.io') [![license](https://img.shields.io/badge/license-MIT-blue.svg?style=plastic)]()

## About Cleanroom

Cleanroom is a utility that we use in order to run curl and httpie without having to install and configure them on the host machine. 

### About Curl

> *From [the official website](https://curl.haxx.se/):*

curl is used in command lines or scripts to transfer data. It is also used in cars, television sets, routers, printers, audio equipment, mobile phones, tablets, settop boxes, media players and is the internet transfer backbone for thousands of software applications totally affecting more than one billion users.

### About HTTPie

> *From [the official readme](https://github.com/jakubroztocil/httpie#readme):*

HTTPie (pronounced aych-tee-tee-pie) is a *command line HTTP client*.
Its goal is to make CLI interaction with web services as human-friendly as possible.
It provides a simple http command that allows for sending arbitrary HTTP requests using a simple and natural syntax,
and displays colorized responses. HTTPie can be used for testing, debugging, and generally interacting with HTTP servers.

## Install

`$ docker pull embrasure/cleanroom`

For ease of use, it is recommended that you configure an alias for the one or more of the following commands:

`$ alias curl='docker run -it --rm embrasure/cleanroom curl'`

`$ alias http='docker run -it --rm embrasure/cleanroom http'`

If you wish for this alias to persist on reboot, you can append this line to your `~/.bashrc` (or similiar file):

`$ alias curl >> ~/.bashrc`

`$ alias http >> ~/.bashrc`

## Usage

####### curl GET example

`$ docker run -it --rm embrasure/cleanroom curl -X GET https://example.org`

####### HTTPie GET example

`$ docker run -it --rm embrasure/cleanroom http https://example.org`

####### curl download to mapped volume

`$ docker run -it --rm -v $(pwd):/scratch embrasure/cleanroom curl -L https://commons.wikimedia.org/wiki/Example_images#/media/File:Example.jpg -o Example.jpg`

####### HTTPie download to mapped volume

`$ docker run -it --rm -v $(pwd):/scratch embrasure/cleanroom http -d https://commons.wikimedia.org/wiki/Example_images#/media/File:Example.jpg -o Example2.jpg`

####### curl GET with custom CA example

`$ docker run -it --rm -v /yourcertlocation/:/usr/local/share/ca-certificates/ -e CUSTOM_CA=true embrasure/cleanroom curl -X GET https://example.org`

####### HTTPie GET with custom CA example

`$ docker run -it --rm -v /yourcertlocation/:/usr/local/share/ca-certificates/ -e CUSTOM_CA=true embrasure/cleanroom http https://example.org`