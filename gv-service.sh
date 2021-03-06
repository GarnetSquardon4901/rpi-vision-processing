if (ps -a | grep pyro4-ns) || (ps -a | grep mjpg-streamer) || (ps -a | grep java) || (ps -a | grep python); then
	echo Garnet Vision process already running. Aborting.
	exit
fi

# Turn LEDs blue indicating that the process is starting
. /home/pi/start_led.sh

./start_all.sh

./gv-service-mon.sh &

python3 wait_for_shutdown.py

./stop_all.sh
sudo poweroff
