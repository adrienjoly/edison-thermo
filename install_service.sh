# to be run once on the edison, after files are pushed to /home/root.thermometre,
# so that main.js runs automatically on startup.

# inspired by: https://www.getstructure.io/blog/edison-automatic-process-startup
# and: http://shawnhymel.com/792/run-a-script-on-edison-boot/
# reference: https://www.freedesktop.org/software/systemd/man/systemd.service.html

# first, do this if needed:
#npm install --global mraa jsupm_i2clcd

cp thermometre.service /lib/systemd/system/
systemctl daemon-reload
systemctl enable thermometre.service
systemctl | grep thermometre
reboot

# ... then use the following command to remove the auto-start:
#systemctl disable thermometre.service
#systemctl | grep thermometre
