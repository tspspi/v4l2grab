# v4l2grab

This utility is *not* my work, it's a tool by Tobias Mueller
and can be found at [https://github.com/twam/v4l2grab](https://github.com/twam/v4l2grab).
I've created this local fork just to learn how to decode
webcam frames (truncated motion JPEG using default tables)
using libjpeg - and "porting" this utility to FreeBSD by
applying some minor fixes.

Note that currently only ```mmap``` method works under FreeBSD
