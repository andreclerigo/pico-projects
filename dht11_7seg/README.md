# Explaining
This repository shows you how to use a DHT11 with a raspberry pi pico.  
I looked at this issue on [pico-examples from raspberry pi](https://github.com/raspberrypi/pico-examples/issues/11) and changed this line `if (count > 16) data[j / 8] |= 1;` to `if (count > 46) data[j / 8] |= 1;`  

# Wiring with custom board
![alt text](https://i.imgur.com/Bz7d3DG.png)

# Wiring with DHT11 barebons
![alt text](https://i.imgur.com/AJC070c.png)

# Notes
Using a 7 segment display 5641AS<br>
The code should be generalized for any other generic 7 segement display<br>
