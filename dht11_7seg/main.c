#include <stdio.h>
#include <math.h>
#include "pico/stdlib.h"
#include "hardware/gpio.h"
#include "pico/multicore.h"

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

const uint DHT_PIN = 5;
const uint MAX_TIMINGS = 85;
/**
  --A--
  F   B
  --G--
  E   C
  --D-- ::
        DP
 **/

#ifdef PICO_DEFAULT_LED_PIN
#define LED_PIN PICO_DEFAULT_LED_PIN
#endif

typedef struct {
    float humidity;
    float temp_celsius;
} dht_reading;

void read_from_dht(dht_reading *result);

// Light up the right display
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
    while (true)
    {
        dht_reading reading;
        read_from_dht(&reading);
        float temp = reading.temp_celsius;
        printf("temp= %.2f\n", temp);
        sprintf(str, "%.2f", temp);

        //printf("%.4f\n", temp);  // Strange conversion debug
        printf("Temperature: %.1f\n", temp);  // Serial Debug

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
        sleep_ms(30 * 1000);  // Wait 90 seconds
    }
}

// Core 0 Main Code
int main()
{
    stdio_init_all();
    #ifdef LED_PIN
        gpio_init(LED_PIN);
        gpio_set_dir(LED_PIN, GPIO_OUT);
    #endif
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
    gpio_init(DHT_PIN);
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

void read_from_dht(dht_reading *result) {
    int data[5] = {0, 0, 0, 0, 0};
    uint last = 1;
    uint j = 0;

    gpio_set_dir(DHT_PIN, GPIO_OUT);
    gpio_put(DHT_PIN, 0);
    sleep_ms(18);
    gpio_set_dir(DHT_PIN, GPIO_IN);
    sleep_us(40);


#ifdef LED_PIN
    gpio_put(LED_PIN, 1);
#endif
    for (uint i = 0; i < MAX_TIMINGS; i++) {
        uint count = 0;
        while (gpio_get(DHT_PIN) == last) {
            count++;
            sleep_us(1);
            if (count == 255) break;
        }
        last = gpio_get(DHT_PIN);
        if (count == 255) break;

        if ((i >= 4) && (i % 2 == 0)) {
            data[j / 8] <<= 1;
            if (count > 46) data[j / 8] |= 1;
            j++;
        }
    }
#ifdef LED_PIN
    gpio_put(LED_PIN, 0);
#endif

    if ((j >= 40) && (data[4] == ((data[0] + data[1] + data[2] + data[3]) & 0xFF))) {
        result->humidity = (float) ((data[0] << 8) + data[1]) / 10;
        if (result->humidity > 100) {
            result->humidity = data[0];
        }
        result->temp_celsius = (float) (((data[2] & 0x7F) << 8) + data[3]) / 10;
        if (result->temp_celsius > 125) {
            result->temp_celsius = data[2];
        }
        if (data[2] & 0x80) {
            result->temp_celsius = -result->temp_celsius;
        }
    } else {
        printf("Bad data\n");
    }
}
