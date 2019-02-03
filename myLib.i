# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1
# 22 "myLib.h"
extern unsigned short *videoBuffer;
# 42 "myLib.h"
void loadPalette(const unsigned short *palette);
void setPixel4(int row, int col, unsigned short colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex);
void drawImage4(int row, int col, int height, int width, const unsigned short *image);
void drawFullScreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();
# 70 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;





typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;


extern DMA *dma;
# 132 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);


int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "myLib.c" 2
# 1 "text.h" 1


void drawChar4(int row, int col, char ch, unsigned char colorIndex);
void drawString4(int row, int col, char *str, unsigned char colorIndex);
# 3 "myLib.c" 2
# 1 "game.h" 1


typedef struct {
    int row;
    int col;
    int height;
    int width;
    int rdel;
    int cdel;
    int active;
} APPLE;


typedef struct {
    int row;
    int col;
    int height;
    int width;
    unsigned short color;
    int cdel;
    int basketTimer;
} BASKET;
# 31 "game.h"
enum{BLACKID=(256-6), BLUEID, GREENID, REDID, WHITEID, GRAYID};
extern unsigned short colors[6];


extern BASKET basket;
extern APPLE apples[10];
extern int applesCollected;
extern int applesMissed;


void initGame();
void updateGame();
void initBasket();
void updateBasket();
void initApples();
void updateApple(APPLE *);
void drawGame();
void drawBasket();
void drawApple(APPLE *);
# 4 "myLib.c" 2
# 1 "applelandscape.h" 1
# 21 "applelandscape.h"
extern const unsigned short applelandscapeBitmap[19200];


extern const unsigned short applelandscapePal[256];
# 5 "myLib.c" 2



unsigned short *videoBuffer = (unsigned short *)0x6000000;


DMA *dma = (DMA *)0x40000B0;

void loadPalette(const unsigned short *palette) {
   DMANow(3, palette, ((unsigned short *)0x5000000), 256);
}

void setPixel4(int row, int col, unsigned short colorIndex) {
    int offset = ((row) * 240 + (col)) >> 1;
    unsigned short pixel = videoBuffer[offset];

    if (col & 1) {

        videoBuffer[offset] = (colorIndex << 8) | (pixel & 0x00FF);
    } else {

        videoBuffer[offset] = colorIndex | (pixel & 0xFF00);

    }
}
void fillScreen4(volatile unsigned char colorIndex) {

    volatile unsigned int color = colorIndex << 24 | colorIndex << 16 | colorIndex << 8 | colorIndex;

    DMANow(3, &color, videoBuffer, (2 << 23) | (1 << 26) | (240 * 160 / 4));


}

void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex) {

    volatile unsigned short color = colorIndex | colorIndex << 8;


    if (col & 1) {

        if (width & 1) {

            for (int r = 0; r < height; r++) {
                setPixel4(row + r, col, color);
                if (width > 1) {

                    DMANow(3, &color, &videoBuffer[((row+r)*(240)+((col + 1)))/2], (2 << 23) | (width/2));




                }

            }
        } else {

            for (int r = 0; r < height; r++) {
                setPixel4(row + r, col, color);
                if (width > 2) {
                    DMANow(3, &color, &videoBuffer[((row+r)*(240)+((col + 1)))/2], (2 << 23) | (width/2));




                }
                setPixel4(row + r, (col + width - 1), color);
            }

        }
    } else {
        if (width & 1) {

            for (int r = 0; r < height; r++) {
                if (width > 1) {
                    DMANow(3, &color, &videoBuffer[((row+r)*(240)+(col))/2], (2 << 23) | (width/2));




                }
                setPixel4(row + r, (col + width - 1), color);
            }
        } else {

            for (int r = 0; r < height; r++) {


                DMANow(3, &color, &videoBuffer[((row+r)*(240)+(col))/2], (2 << 23) | (width/2));



            }
        }
    }

}


void drawImage4(int row, int col, int height, int width, const unsigned short *image) {
    unsigned char *img = (unsigned char*)image;



    for (int r = 0; r < height; r++) {
        DMANow(3, &image[((r)*(width)+(0))/2], &videoBuffer[((row+r)*(240)+(col))/2], width/2);



    }
}


void drawFullScreenImage4(const unsigned short *image) {


    DMANow(3, image, videoBuffer, (240 * 160) / 2);
}


void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {


    dma[channel].cnt = 0;


    dma[channel].src = src;
    dma[channel].dst = dst;


    dma[channel].cnt = cnt | (1 << 31);
}


void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) > 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}
void flipPage() {
    if ((*(unsigned short *)0x4000000) & (1<<4)) {
        videoBuffer = ((unsigned short *)0x600A000);
    } else {
        videoBuffer = ((unsigned short *)0x6000000);
    }
    (*(unsigned short *)0x4000000) ^= (1<<4);
}


int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {
    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}
