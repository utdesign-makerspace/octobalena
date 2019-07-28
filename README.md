# balena-octoprint-alpine
remotely control your 3d-printer with [octoprint](https://github.com/foosel/OctoPrint) and balena.io !

**octoprint is exposed on port 80 which can be remotely accessible via balena.io [public URL](https://docs.balena.io/management/devices/#enable-public-device-url) feature**

# Fork Notes

This fork exist to move balena-octoprint to alpine, and to improve things generally. The upstream does not at this time utilise multiple containers, which goes against the philosophy of docker [which suggests running a single process per container.](https://devops.stackexchange.com/questions/447/why-it-is-recommended-to-run-only-one-process-in-a-container)

My fork produces a smaller build size (270~MB), faster boot time, faster balena build time and less CPU overhead as a result of using Alpine. I aim to improve this further in the future.

Furthermore, Octoprint itself is incredibly inefficient, firstly because it is doing a lot of fancy things and optimization does not come first in their development philosophy. And secondly because it is still using Python 2.7 at this time. The only way to get this to run reliably and performantly on a Raspberry Pi Zero is to drastically reduce the overhead

This is achieved with the Balena setup due to how optimized the BalenaOS hypervisor is. Octoprint is running as a single process in an uninterrupted container, supported by the optimal hypervisor.

Currently the only thing that doesn't work is the camera module, since I'm just getting started, I'll be working on getting that working first and foremost.

# TODO

- [ ] Build a webcam container


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

Copyright 2019 Matthew Croughan. 

Code produced after 2019 by Matthew Croughan is under GPLv2+

<https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html>

Copyright 2016 balenaio Ltd.

is Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
