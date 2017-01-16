# The Instant OpenCV and FFMPEG Library

> You've spent three weeks trying to install OpenCV and FFMPEG on the cluster and feel like pulling your hair out because it *just wont work*. Don't worry. We got you covered.

This folder contains ffmpeg and opencv almost ready to work out of the box. Specifically, here's the parts:

- `2.5.0/` A folder with the ffmpeg binaries
- `ffmpeg_built` Another folder necessary for ffmpeg
- `opencv-2.4.11` Opencv files
- `python2.7` I don't remember why this is here, but removing it will likely cause things to break, so dont.

## Now, to get things up and running:

All you must do is setup a bash initialization file which will add the paths to opencv and ffmpeg into the necessary environment variables.

You should see the following in `instant_init.sh`

```
libpath=`dirname $0 | while read a; do cd $a && pwd && break; done`

export PYTHONPATH="$PYTHONPATH:$libpath/opencv-2.4.11/lib/python2.7/site-packages"
#echo $PYTHONPATH
export LD_LIBRARY_PATH=$libpath/opencv-2.4.11/lib:$libpath/2.5.0/lib/:$LD_LIBRARY_PATH
#echo $LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$libpath/opencv-2.4.11/lib/pkgconfig/:$libpath/ffmpeg_built/lib/pkgconfig:$PKG_CONFIG_PATH
#

echo $PKG_CONFIG_PATH

```

### For using opencv and ffmpeg in an ssh shell environment

Say you're logged into spock or tiger and would like to do some file conversions or play around with opencv in ipython. To make this possible:

Find the path to `instant_init.sh` and put `source path/to/instant_init.sh` in your `.bashrc`.

### For using opencv and ffmpeg during slurm runs

You'll need to make sure the file you are submitting to sbatch is a bash file – this instantiates a new bash environment. Then, append the following to your sbatch file:  `source "path/to/instant_init.sh"`

You're all setup.
