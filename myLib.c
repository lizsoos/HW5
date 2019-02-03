#include "myLib.h"
#include "text.h"
#include "game.h"
#include "applelandscape.h"


//Start of video memory
unsigned short *videoBuffer = (unsigned short *)0x6000000;

//The start of DMA registers
DMA *dma = (DMA *)0x40000B0;

void loadPalette(const unsigned short *palette) {
   DMANow(3, palette, PALETTE, 256);
}

void setPixel4(int row, int col, unsigned short colorIndex) {
    int offset = ((row) * 240 + (col)) >> 1;
    unsigned short pixel = videoBuffer[offset];

    if (col & 1) {
        //Odd: copy to the upper portion, bit shift
        videoBuffer[offset] = (colorIndex << 8) | (pixel & 0x00FF);
    } else {
        //Even: copy to the lower portion - no bit shifting needed
        videoBuffer[offset] = colorIndex | (pixel & 0xFF00);

    }
}
void fillScreen4(volatile unsigned char colorIndex) {
    //Setting four pixels at a time
    volatile unsigned int color = colorIndex << 24 | colorIndex << 16 | colorIndex << 8 | colorIndex;
    //Chunk size = 32, Since setting 4 pixels at a time, divide pixel # by 4
    DMANow(3, &color, videoBuffer, DMA_SRC_FIXED | DMA_32 | (SCREENWIDTH * SCREENHEIGHT / 4));


}

void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex) {

    volatile unsigned short color = colorIndex | colorIndex << 8;
    //volatile unsigned short color = colorIndex;
    //Check for width of atleast 1 (odd) and 2 (even)
    if (col & 1) {

        if (width & 1) {
            //Odd col and odd width: setPixel at the begninning and DMA at the end (odd + odd = even)
            for (int r = 0; r < height; r++) {
                setPixel4(row + r, col, color);
                if (width > 1) {

                    DMANow(3, &color, &videoBuffer[OFFSET(row+r, (col + 1), SCREENWIDTH)/2], DMA_SRC_FIXED | (width/2));
                    //for loop for setpixel for each row
                    // for (int c = 0; c < width; c++) {
                    //     setPixel4(row + r, col + c + 1, colorIndex);
                    // }
                }

            }
        } else {
            //Odd col and even width: setPixel at the beginning, DMA middle, setPixel at the end
            for (int r = 0; r < height; r++) {
                setPixel4(row + r, col, color);
                if (width > 2) {
                    DMANow(3, &color, &videoBuffer[OFFSET(row+r, (col + 1), SCREENWIDTH)/2], DMA_SRC_FIXED | (width/2));

                    // for (int c = 0; c < width; c++) {
                    //     setPixel4(row + r, col + c + 1, colorIndex);
                    // }
                }
                setPixel4(row + r, (col + width - 1), color);
            }

        }
    } else {
        if (width & 1) {
            //Even col and odd width: DMA beginning, setPixel at the end
            for (int r = 0; r < height; r++) {
                if (width > 1) {
                    DMANow(3, &color, &videoBuffer[OFFSET(row+r, col, SCREENWIDTH)/2], DMA_SRC_FIXED | (width/2));
                    // for (int c = 0; c < width; c++) {
                    //     setPixel4(row + r, col + c, colorIndex);
                    // }

                }
                setPixel4(row + r, (col + width - 1), color);
            }
        } else {
            //Even col and even width: can just DMA everything, also must be greater than 2 if even col and even width
            for (int r = 0; r < height; r++) {

                //#define OFFSET(row, col, rowlen)
                DMANow(3, &color, &videoBuffer[OFFSET(row+r, col, SCREENWIDTH)/2], DMA_SRC_FIXED | (width/2));
                // for (int c = 0; c < width; c++) {
                //     setPixel4(row + r, col + c + 1, colorIndex);
                // }
            }
        }
    }

}


void drawImage4(int row, int col, int height, int width, const unsigned short *image) {
    unsigned char *img = (unsigned char*)image;



    for (int r = 0; r < height; r++) {
        DMANow(3, &image[OFFSET(r, 0, width)/2], &videoBuffer[OFFSET(row+r, col, SCREENWIDTH)/2], width/2);
        // for (int c=0;c<width;c++){
        //     setPixel4(r+row, c+col, img[r*width+c]);
        // }
    }
}


void drawFullScreenImage4(const unsigned short *image) {


    DMANow(3, image, videoBuffer, (SCREENWIDTH * SCREENHEIGHT) / 2);
}

// Set up and begin a DMA transfer
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    // Turn DMA off
    dma[channel].cnt = 0;

    // Set source and destination
    dma[channel].src = src;
    dma[channel].dst = dst;

    // Set control and begin
    dma[channel].cnt = cnt | DMA_ON;
}

//Wait for VBlank to flip pages
void waitForVBlank() {
    while (SCANLINECOUNTER > 160);
    while (SCANLINECOUNTER < 160);
}
void flipPage() {
    if (REG_DISPCTL & DISP_BACKBUFFER) {
        videoBuffer = BACKBUFFER; //true if showing back, false otherwise
    } else {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER; //Flip every time
}


int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {
    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}