import board
import digitalio
import sys

#print (sys.argv[0]) # prints python_script.py
#print (sys.argv[1]) # prints var1
#print (sys.argv[2]) # prints var2
#print (sys.argv[3]) # prints var2

Pin = sys.argv[1]
Dir = sys.argv[2]
Val = sys.argv[3]

if Pin == 'C0':
    io = board.C0
elif Pin == 'C1':
    io = board.C1
elif Pin == 'C2':
    io = board.C2
elif Pin == 'C3':
    io = board.C3
elif Pin == 'C4':
    io = board.C4
elif Pin == 'C5':
    io = board.C5
elif Pin == 'C6':
    io = board.C6
elif Pin == 'C7':
    io = board.C7
elif Pin == 'C8':
    io = board.C8
elif Pin == 'C9':
    io = board.C9
elif Pin == 'D4':
    io = board.D4
elif Pin == 'D5':
    io = board.D5
elif Pin == 'D6':
    io = board.D6
elif Pin == 'D7':
    io = board.D7
else:
    print("No Pin Selected")
    sys.exit()


if Dir == 'out':
    dirIO = digitalio.Direction.OUTPUT
elif Dir == 'in':
    dirIO = digitalio.Direction.INPUT
else:
    print("No Direction selected")
    sys.exit()

if Val == 'high':
    ioVal = True
elif Val == 'low':
    ioVal = False
else:
    print("No Value selected")


pinIO = digitalio.DigitalInOut(io)
pinIO.direction = dirIO

if Dir == 'in':
    print(pinIO.value)
elif Dir == 'out':
    pinIO.value = ioVal
else:
    print("Error")
    sys.exit()

sys.exit()
