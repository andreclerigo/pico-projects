#include <stdio.h>
#include "pico/stdlib.h"
#include "hardware/timer.h"
#include "hardware/gpio.h"
#include "ss_oled.h"

// RPI Pico
#define SDA_PIN 4
#define SCL_PIN 5
#define RESET_PIN -1
const uint DHT_PIN = 15;
const uint MAX_TIMINGS = 85;
int rc;
SSOLED oled;
static uint8_t ucBuffer[1024];
char str[5];
#define OLED_WIDTH 128
#define OLED_HEIGHT 32

typedef struct {
    float humidity;
    float temp_celsius;
} dht_reading;

void read_from_dht(dht_reading *result);

int main()
{
    int i, j;
    char szTemp[32];

    rc = oledInit(&oled, OLED_128x32, 0x3c, 0, 0, 1, SDA_PIN, SCL_PIN, RESET_PIN, 1000000L);
    sleep_ms(3000);

    while (1)
    {
        dht_reading reading;
        read_from_dht(&reading);
        float temp = reading.temp_celsius;
        printf("temp= %.2f\n", temp);
        sprintf(str, "%.2f", temp);

        //printf("%.4f\n", temp);  // Strange conversion debug
        printf("Temperature: %.1f\n", temp);  // Serial Debug
        sleep_ms(30 * 1000);  // Wait 30 seconds

        oledFill(&oled, 0, 1);
        oledSetContrast(&oled, 127);
        oledWriteString(&oled, 0,0,0,(char *)str, FONT_8x8, 0, 1);
        sleep_ms(2000);
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