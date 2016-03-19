I started this minimal project to re-use the arduino board setup from [TCup](https://github.com/adrienjoly/tcup-sensor) (with Grove LCD display and thermometer), and make sure that it would run automatically when I plug my Intel Edison board.

## Findings

I ended up spending a lot of time making sure that it works properly on startup.

Initially, I was downloading the project's files to `/node_app_slot/` (which seems somewhat linked to `/home/root/.node_app_slot/`, for some reason), so that Intel's XDK would automatically run it on startup. It did, but the text was blinking/flickering on the screen, making it almost not readable.

After hours of research, I realized that:

- The same problem happens if I setup a systemd service instead of relying on XDK daemon for running the script on startup.
- But I finally solved the problem by setting the service's `TimeoutStartSec` parameter to `20` seconds.

## Setup

In this section, I'm keep some instructions to remember how to make it work again later:

1. Plug both USB cables between Edison and the computer
2. Connect to Edison's terminal by
  - finding its “usbserial” device name: `ls /dev/tty.*`
  - connecting to the device: `screen /dev/tty.usbserial-A102GW3T 115200`
  - logging in as root
  - keeping these shortcuts in mind:
    - Cancel/exit a command: <kbd>Ctrl-C</kbd>
    - Disconnect: <kbd>Ctrl+A</kbd> then <kbd>Ctrl+\\</kbd>
3. Initialize Edison's connectivity
  - full setup: `configure_edison --setup`
  - only wifi: `configure_edison --wifi`
  - get IP address: `configure_edison --showWiFiIP` or `ip a`
4. After having setup a password for the root account, connect to ssh server through Wifi (*the second USB cable does not longer need to be plugged*):
  - `ssh root@edison.local`
5. Push/download the program to Edison, from computer:
  - `./push.sh`
6. Initialize and run the program on Edison:
  - `cd thermometre`
  - `npm install`
  - `node main`
7. Make it run automatically on startup:
  - `./install_service.sh`
