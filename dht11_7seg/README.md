# Explaining Code and Resistances
This repository shows you how to use a DHT11 with a raspberry pi pico.  
I looked at this issue on [pico-examples from raspberry pi](https://github.com/raspberrypi/pico-examples/issues/11) and changed this line 
```
if (count > 16) data[j / 8] |= 1; to if (count > 46) data[j / 8] |= 1;
```  
also these lines 
```
gpio_set_dir(DHT_PIN, GPIO_OUT);
gpio_put(DHT_PIN, 0);
sleep_ms(20);
gpio_set_dir(DHT_PIN, GPIO_IN);
```
were changed to
```
gpio_set_dir(DHT_PIN, GPIO_OUT);
gpio_put(DHT_PIN, 0);
sleep_ms(18);
gpio_put(DHT_PIN,1);
sleep_us(40);
```
Since those correct the initialisation for the DHT11 (better explained [here](http://www.ocfreaks.com/basics-interfacing-dht11-dht22-humidity-temperature-sensor-mcu/))  
  
What I found out is that this works best when there is a 4.7k Ohm pull resistance so if you have a DHT11 "barebones" this means only the module and no board attached, then you can follow the Wiring for DHT11 barebones  
If you have a DHT11 module attached to a board odds are you have an onboard resistance and therefore you should either increase or decrease the current resistance by putting another resistance in parallel  
  
You should know that:
- Having resistances in series adds up the result of the equivelant resistance `Req = R1 + R2 + ...`  
- Having resistances in parallel the way you calculate the equivelant resistance is `Req = 1/R1 + 1/R2 + ...` 

I this case I show the most complicated thing that is using resistances in series to add up to a total value of 55k Ohm and then use that equivelant resistance in parallel to pull my resistance down to 4.7k  
  
My module has an onboard 5.1k resistance so to get 4.7k I'll have to get a 55k Ohm resistance in parallel which is done by putting 5x 10k Ohm resistances in series with a 5.5k Ohm resistance  
```
4.7k = 1/5.1k + 1/R (=) R = 55k Ohm
55k = 4*10k + 5.5k
```

# Wiring with onboard resistance
![alt text](https://i.imgur.com/Bz7d3DG.png)

# Wiring with DHT11 barebones
![alt text](https://i.imgur.com/AJC070c.png)

# Notes
Using a 7 segment display 5641AS<br>
The code should be generalized for any other generic 7 segement display<br>
