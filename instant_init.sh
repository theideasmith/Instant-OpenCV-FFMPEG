# The path to the current directory
libpath=`dirname $0 | while read a; do cd $a && pwd && break; done`

# Adding OpenCv to pythonpath
export PYTHONPATH="$PYTHONPATH:$libpath/opencv-2.4.11/lib/python2.7/site-packages"

# Adding OpenCV to the linked libraries path for python
export LD_LIBRARY_PATH=$libpath/opencv-2.4.11/lib:$libpath/2.5.0/lib/:$LD_LIBRARY_PATH

# Also for linking opencv and ffmpeg for use in python
export PKG_CONFIG_PATH=$libpath/opencv-2.4.11/lib/pkgconfig/:$libpath/ffmpeg_built/lib/pkgconfig:$PKG_CONFIG_PATH
