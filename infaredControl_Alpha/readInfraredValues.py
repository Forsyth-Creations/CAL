import RPi.GPIO as GPIO
from datetime import datetime
from time import sleep
import time

#Define the GPIO
INPUT_WIRE = 18

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
GPIO.setup(INPUT_WIRE, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

print ""
print "IR Remote Code Reader"
print "----------------"

while True:
	#first section of code is to detect the start bit
	high_previous = False
	while True:
  	  if not high_previous:
	   while GPIO.input(INPUT_WIRE):pass
	   pulse_high = datetime.now()
	  while not GPIO.input(INPUT_WIRE):pass
	  pulse_low = datetime.now()
	  pulseLength = pulse_low - pulse_high
	  while GPIO.input(INPUT_WIRE):pass
	  pulse_high = datetime.now()
	  off_time = pulse_high - pulse_low
	  high_previous = True
	  if pulseLength.microseconds > 3000 :
		if pulseLength.microseconds > 6000 : start_big = True
		else : start_big = False
		if off_time.microseconds < 3000 : repeat_code = True
		else : repeat_code = False
		break

	#this part of the program reads the address byte and command 
	#byte providing it hasn't recived the repeate code
	command = []
	if not repeat_code :
	  while True:
		while not GPIO.input(INPUT_WIRE):pass
		pulse_low = datetime.now()
		while GPIO.input(INPUT_WIRE):pass
		pulse_high = datetime.now()
		off_time = pulse_high - pulse_low
		if off_time.microseconds > 2500 : break
		if off_time.microseconds < 1000 : command.append(0)
		else : command.append(1)

	#this part of the program prints to the screen the results
#	if len(command) < 2 : print "REPEAT"
	if len(command) < 2 : print ""
	elif len(command) == 32 :
	  bit = 0b10000000
	  address = 0
	  address_inv = 0
	  instruction = 0
	  instruction_inv = 0
	  for position in range(8) :
		if command[position] : 	address = address | bit
		if command[position +8] : address_inv = address_inv | bit
		if command[position +16] : instruction = instruction | bit
		if command[position +24] : instruction_inv = instruction_inv | bit
		bit = bit >> 1
#Snif the remote 
	  print "Big start bit = " + str(start_big)
	  print "Byte 1 = " + str(address)
	  print "Byte 2 = " + str(address_inv)
	  print "Byte 3 = " + str(instruction)
	  print "Byte 4 = " + str(instruction_inv) 


GPIO.cleanup()