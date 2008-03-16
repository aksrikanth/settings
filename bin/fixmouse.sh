echo -e '\e[?1000h' > /dev/`ps -a | grep -i screen | grep -v grep| head -1 | sed 's/.*pts/pts/; s/ .*$//'`
