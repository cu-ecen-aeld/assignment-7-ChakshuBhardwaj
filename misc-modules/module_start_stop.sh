#!/bin/sh

case "$1" in
start)
    echo "Starting faulty module"
    #start-stop-daemon -S -n aesdsocket -a /usr/bin/aesdsocket -- -d
    #start-stop-daemon --start --background --exec /usr/bin/aesdsocket
    cd /lib/modules/5.15.124-yocto-standard/extra/ && module_load faulty
    #./lib/modules/5.15.124-yocto-standard/extra/module_load.sh faulty

    echo "Starting hello module"
    cd /lib/modules/5.15.124-yocto-standard/extra/ && module_load hello
    #./lib/modules/5.15.124-yocto-standard/extra/module_load.sh hello
    ;;
    
stop)
    echo "Stopping faulty module"
    #start-stop-daemon -K -n aesdsocket
    #start-stop-daemon --stop --exec /usr/bin/aesdsocket
    cd /lib/modules/5.15.124-yocto-standard/extra/ && module_unload faulty
    cd /lib/modules/5.15.124-yocto-standard/extra/ && module_unload hello
    #./lib/modules/5.15.124-yocto-standard/extra/module_unload.sh faulty
    #./lib/modules/5.15.124-yocto-standard/extra/module_unload.sh hello
        ;;
*)
    echo "Usage: $0 {start|stop}"
    exit 1
esac

exit 0