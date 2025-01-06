exec(open('/scratch/qkt4685/harmpi2D_0.9spin/harm_script.py').read())
mkmov_simple(starti = 0,endi = 2000)
import subprocess

command = "ffmpeg -i frame%03d.png -vcodec mpeg4 -qmax 5 movie.mp4"
subprocess.run(command, shell=True, check=True)
