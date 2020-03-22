import time
import board
import digitalio
 
led = digitalio.DigitalInOut(board.D6)
led.direction = digitalio.Direction.INPUT

print(led.value)

