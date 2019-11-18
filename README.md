# balena-octoprint-alpine
remotely control your 3d-printer with [octoprint](https://github.com/foosel/OctoPrint) and balena.io !

**octoprint is exposed on port 80 which can be remotely accessible via balena.io [public URL](https://docs.balena.io/management/devices/#enable-public-device-url) feature**

## Getting started

- Sign up on [balena.io](https://dashboard.balena.io/signup)
- go through the [getting started guide](http://docs.balena.io/raspberrypi/nodejs/getting-started/) and create a new application
- clone this repository to your local workspace
- add the _balena remote_ to your local workspace using the useful shortcut in the dashboard UI
- `git push balena master`
- see the magic happening, your device is getting updated Over-The-Air!

## Configure via [environment variables](https://docs.balena.io/management/env-vars/)
Variable Name | Value | Description | Device-specific
------------ | ------------- | ------------- | -------------
**`BALENA_HOST_CONFIG_gpu_mem`** | `128` | the amount of RAM dedicated to the GPU | Raspberry Pi (all revs) - only required if you plan camera streaming
**`BALENA_HOST_CONFIG_start_x`** | `1` | required to enable the Raspberry Pi Camera Module | Raspberry Pi (all revs) - only required if you plan camera streaming

Apply the above settings in the "Fleet Configuration" panel (if applying it for the all devices withing your application), or "Device Configuration" panel (if applying it for a single device).

## License

Work produced after 2019 by Matthew Croughan is under GPLv2+

<https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html>

Copyright 2016 balenaio Ltd.

is Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
