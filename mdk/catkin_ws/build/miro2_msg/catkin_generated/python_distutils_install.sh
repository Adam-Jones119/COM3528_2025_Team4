#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/joel/pkgs/mdk-230105/catkin_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/joel/pkgs/mdk-230105/catkin_ws/install/lib/python3/dist-packages:/home/joel/pkgs/mdk-230105/catkin_ws/build/miro2_msg/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/joel/pkgs/mdk-230105/catkin_ws/build/miro2_msg" \
    "/usr/bin/python3" \
    "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/setup.py" \
     \
    build --build-base "/home/joel/pkgs/mdk-230105/catkin_ws/build/miro2_msg" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/joel/pkgs/mdk-230105/catkin_ws/install" --install-scripts="/home/joel/pkgs/mdk-230105/catkin_ws/install/bin"
