apt install xvfb libgtk-3-0
Xvfb :99 -screen 0 1920x1080x16 &
export DISPLAY=:99
