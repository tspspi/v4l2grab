# v4l2grab

This utility is *not* my work, it's a tool by Tobias Mueller
and can be found at [https://www.twam.info/software/v4l2grab-grabbing-jpegs-from-v4l2-devices](https://www.twam.info/software/v4l2grab-grabbing-jpegs-from-v4l2-devices).
I've created this local fork just to learn how to decode
webcam frames (truncated motion JPEG using default tables)
using libjpeg - and "porting" this utility to FreeBSD.

The later one turned out to be rather simple:
* There is no ```malloc.h``` for POSIX applications, it's
  sufficient to include ```stdlib.h```
* I had to remove ```asm/types.h``` include

Then compiling turned out to be pretty easy (added an Makefile
for that). Note taht ```webcamd``` seems to support only
the ```mmap``` I/O method, ```read``` and ```userptr``` are
not supported.
