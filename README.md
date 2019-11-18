# balena-octoprint-alpine
Remotely control your 3d-printer with [octoprint](https://github.com/foosel/OctoPrint) and balena.io !

**octoprint can be exposed on port 80 which can be remotely accessible via balena.io [public URL](https://docs.balena.io/management/devices/#enable-public-device-url) feature**

## Getting started

- Sign up on [balena.io](https://dashboard.balena.io/signup)
- go through the [getting started guide](http://docs.balena.io/raspberrypi/nodejs/getting-started/) and create a new application
- clone this repository to your local workspace
- add the _balena remote_ to your local workspace using the useful shortcut in the dashboard UI
- `git push balena master`
- see the magic happening, your device is getting updated Over-The-Air!

## Attribution

- This is in part based on excellent work done by the Balena.io team

@see: https://github.com/balena-io-projects/balena-octoprint
