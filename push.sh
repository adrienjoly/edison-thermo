# script to run from the computer, in order to install the script on the edison.

# if you want thermometre to run on startup, thanks to XDK deamon:
#scp -r ./ root@edison.local:/node_app_slot/

# ... or you can use that, then run install_service.sh on the edison:
scp -r ./ root@edison.local:/home/root/thermometre
