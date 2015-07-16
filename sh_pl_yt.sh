#!/bin/bash
# playing from command line
# plv 'link1' 'link2' 'link3'
# or
# plv 'link1'
# plv 'link2'
# plv function ripped from commandlinefu user: snipertyler

pvl() { (for i in "$@"; do youtube-dl -q --max-downloads 1 --no-playlist "$i" -o - | mplayer -vo null /dev/fd/3 3<&0 </dev/tty; sleep .5; done); }

(mplayer >> /dev/null 2>&1) || (echo no mplayer installed;sleep 500000)
(youtube-dl --version >> /dev/null 2>&1) || (echo no youtube-dl installed;sleep 500000)

pvl 'http://www.youtube.com/watch?v=5AOI0aXiL6I' 'https://www.youtube.com/watch?v=svngvOLPd5E'
