#!/usr/bin/env python3

from os import listdir, system, environ
from os.path import join, splitext
from time import sleep
import signal
from pyfiglet import Figlet

if environ['VIDEO_DEVICE'] != '':
    VIDEO_DEVICE = environ['VIDEO_DEVICE']
else:
    VIDEO_DEVICE = '/dev/video0' 

def main():
    figl = Figlet(font='standard')
    print(figl.renderText('StreamEye'))

    print("Streaming video device:", VIDEO_DEVICE)
    cmd = 'ffmpeg -f video4linux2 -i %s -r 24 -s 640x480 -f mjpeg -qscale 5 - 2>/dev/null | streameye' % (VIDEO_DEVICE)
    print(cmd)
    system(cmd)

if __name__ == '__main__':
    main()
