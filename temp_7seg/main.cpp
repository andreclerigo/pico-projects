#include <stdio.h>
#include "pico/stdlib.h"
#include "hardware/gpio.h"
#include "hardware/adc.h"
#include "pico/multicore.h"
#include "hardware/irq.h"

int displays[] = {15, 12, 11, 20};
const int pinA = 14;
const int pinB = 10;
const int pinC = 18;
const int pinD = 17;
const int pinE = 16;
const int pinF = 13;
const int pinG = 19;
const int pinDP = 21;
const int D1 = 15;
const int D2 = 12;
const int D3 = 11;
const int D4 = 20;
bool dot = false;
char str[5];

/**
    A
   ---
F |   | B
  | G |
   ---
E |   | C
  |   | 
   ---  ::
    D   DP
 **/

void segment(int displays[], int index) 
{
  for(int i = 0; i < 4; i++) {
    gpio_put(displays[i], 1);
    if (i == index - 1) 
      gpio_put(displays[index - 1], 0);
  }
}

// Debug function for weird values
void x() 
{
    gpio_put(pinA, 0);   
    gpio_put(pinB, 0);   
    gpio_put(pinC, 0);   
    gpio_put(pinD, 0);   
    gpio_put(pinE, 0);   
    gpio_put(pinF, 0);   
    gpio_put(pinG, 0);
    gpio_put(pinDP, dot);
}

void zero(bool dot) 
{
    gpio_put(pinA, 1);   
    gpio_put(pinB, 1);   
    gpio_put(pinC, 1);   
    gpio_put(pinD, 1);   
    gpio_put(pinE, 1);   
    gpio_put(pinF, 1);   
    gpio_put(pinG, 0);
    gpio_put(pinDP, dot);
}

void one(bool dot) 
{
    gpio_put(pinA, 0);   
    gpio_put(pinB, 1);   
    gpio_put(pinC, 1);   
    gpio_put(pinD, 0);   
    gpio_put(pinE, 0);   
    gpio_put(pinF, 0);   
    gpio_put(pinG, 0);
    gpio_put(pinDP, dot);
}

void two(bool dot) 
{
    gpio_put(pinA, 1);   
    gpio_put(pinB, 1);   
    gpio_put(pinC, 0);   
    gpio_put(pinD, 1);   
    gpio_put(pinE, 1);   
    gpio_put(pinF, 0);   
    gpio_put(pinG, 1);
    gpio_put(pinDP, dot);
}

void three(bool dot) 
{
    gpio_put(pinA, 1);   
    gpio_put(pinB, 1);   
    gpio_put(pinC, 1);   
    gpio_put(pinD, 1);   
    gpio_put(pinE, 0);   
    gpio_put(pinF, 0);   
    gpio_put(pinG, 1);
    gpio_put(pinDP, dot);
}

void four(bool dot) 
{
    gpio_put(pinA, 0);   
    gpio_put(pinB, 1);   
    gpio_put(pinC, 1);   
    gpio_put(pinD, 0);   
    gpio_put(pinE, 0);   
    gpio_put(pinF, 1);   
    gpio_put(pinG, 1);
    gpio_put(pinDP, dot);
}

void five(bool dot) 
{
    gpio_put(pinA, 1);   
    gpio_put(pinB, 0);   
    gpio_put(pinC, 1);   
    gpio_put(pinD, 1);   
    gpio_put(pinE, 0);   
    gpio_put(pinF, 1);   
    gpio_put(pinG, 1);
    gpio_put(pinDP, dot);
}

void six(bool dot) 
{
    gpio_put(pinA, 1);   
    gpio_put(pinB, 0);   
    gpio_put(pinC, 1);   
    gpio_put(pinD, 1);   
    gpio_put(pinE, 1);   
    gpio_put(pinF, 1);   
    gpio_put(pinG, 1);
    gpio_put(pinDP, dot);
}

void seven(bool dot) 
{
    gpio_put(pinA, 1);   
    gpio_put(pinB, 1);   
    gpio_put(pinC, 1);   
    gpio_put(pinD, 0);   
    gpio_put(pinE, 0);   
    gpio_put(pinF, 0);   
    gpio_put(pinG, 0);
    gpio_put(pinDP, dot);
}

void eight(bool dot) {
    gpio_put(pinA, 1);   
    gpio_put(pinB, 1);   
    gpio_put(pinC, 1);   
    gpio_put(pinD, 1);   
    gpio_put(pinE, 1);   
    gpio_put(pinF, 1);   
    gpio_put(pinG, 1);
    gpio_put(pinDP, dot);
}

void nine(bool dot) 
{
    gpio_put(pinA, 1);   
    gpio_put(pinB, 1);   
    gpio_put(pinC, 1);   
    gpio_put(pinD, 1);   
    gpio_put(pinE, 0);   
    gpio_put(pinF, 1);   
    gpio_put(pinG, 1);
    gpio_put(pinDP, dot);
}

// Core 1 Main Code
void core1_code()
{
    // Configure temperature sensor
    adc_init();
    adc_set_temp_sensor_enabled(true);
    adc_select_input(4);

    // Get the temperature from then sensor in ºC
    float conversion_factor = 3.3f / (1 << 12);

    while (true)
    {
        float voltage = adc_read() * conversion_factor;
        float temp = 27 - ((voltage - 0.706)/0.001721f);
        sprintf(str, "%.2f", temp);  // Convert float in char array

        //printf("%.4f\n", temp);  // Strange conversion debug
        printf("Temperature: %.2f\n", temp);  // Serial Debug

        if (str[1] == '.')  // Temperatures below 10 ºC
        {
            char temp = str[3];
            str[4] = temp;
            temp = str[2];
            str[3] = temp;
            temp = str[1];
            str[2] = temp;
            temp = str[0];
            str[1] = temp;
            str[0] = '0'; 
        }
        sleep_ms(90 * 1000);  // Wait 90 seconds
    }
}

// Core 0 Main Code
int main()
{
    stdio_init_all();

    multicore_launch_core1(core1_code);  // Start core 1

    // Setup the pins for the 7seg display
    gpio_init(pinA);
    gpio_init(pinB);
    gpio_init(pinC);
    gpio_init(pinD);
    gpio_init(pinE);
    gpio_init(pinF);
    gpio_init(pinG);
    gpio_init(pinDP);
    gpio_init(D1);
    gpio_init(D2);
    gpio_init(D3);
    gpio_init(D4);
    gpio_set_dir(pinA, GPIO_OUT);     
    gpio_set_dir(pinB, GPIO_OUT);     
    gpio_set_dir(pinC, GPIO_OUT);     
    gpio_set_dir(pinD, GPIO_OUT);     
    gpio_set_dir(pinE, GPIO_OUT);     
    gpio_set_dir(pinF, GPIO_OUT);     
    gpio_set_dir(pinG, GPIO_OUT);
    gpio_set_dir(pinDP, GPIO_OUT);  
    gpio_set_dir(D1, GPIO_OUT);  
    gpio_set_dir(D2, GPIO_OUT);  
    gpio_set_dir(D3, GPIO_OUT);  
    gpio_set_dir(D4, GPIO_OUT);

    while(true)
    {   
        
        for (int i = 0; i < 5; i++)
        {   
            dot = false;

            if (i < 2)
            {
                segment(displays, i+1);
            } else if (i == 2) {
                dot = true;
            } else {
                segment(displays, i);
            }
            
            switch(str[i])
            {
                case '0':   
                        zero(dot);
                        break;
                case '1':   
                        one(dot);
                        break;
                case '2':   
                        two(dot);
                        break;
                case '3':   
                        three(dot);
                        break;
                case '4':   
                        four(dot);
                        break;
                case '5':   
                        five(dot);
                        break;
                case '6':   
                        six(dot);
                        break;
                case '7':   
                        seven(dot);
                        break;
                case '8':   
                        eight(dot);
                        break;
                case '9':   
                        nine(dot);
                        break;
                default:
                        x();
            }
            sleep_ms(1);
        }
    }
    return 0;
}
