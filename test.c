#include <bios.h>

#define Enter_Key 0x0d

void copyBuffer2Video(char *buffer);
void setGraphicsMode();
void setTextMode();

char buffer[16384];

void waitForEnter()
{
    unsigned char keycode;
    unsigned char ckeycode;

    do {
        keycode  = bioskey(0);
        ckeycode = keycode & 0xFF;
    } while (ckeycode != Enter_Key);
}

void main()
{
	int x;
    setGraphicsMode();

    for (x = 0; x < 16384; x++) {
        buffer[x] = 0xAA;
    }

    copyBuffer2Video(buffer);
    waitForEnter();

    for (x = 0; x < 16384; x++) {
        buffer[x] = 0x55;
    }

    copyBuffer2Video(buffer);
    waitForEnter();

    setTextMode();
}