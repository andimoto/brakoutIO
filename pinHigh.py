import time
import board
import digitalio
 
led = digitalio.DigitalInOut(board.D0)
led.direction = digitalio.Direction.OUTPUT
 
led.value = True

