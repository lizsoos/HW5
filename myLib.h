#ifndef MY_LIB_H
#define MY_LIB_H

#define OFFSET(row, col, rowlen) ((row)*(rowlen)+(col))

//======DISPLAY======//
//Display Control Register
#define REG_DISPCTL (*(unsigned short *)0x4000000)
#define MODE3 3
#define MODE4 4
#define DISP_BACKBUFFER (1<<4)
#define BG2_ENABLE (1<<10)

//Display Status Registers
#define SCANLINECOUNTER (*(volatile unsigned short *)0x4000006)

//Display Constants
#define SCREENWIDTH 240
#define SCREENHEIGHT 160

//Video Buffer
extern unsigned short *videoBuffer;
#define FRONTBUFFER ((unsigned short *)0x6000000)
#define BACKBUFFER ((unsigned short *)0x600A000)

//Color
#define COLOR(r,g,b) ((r) | (g)<<5 | (b)<<10)
#define BLACK 0
#define WHITE COLOR(31,31,31)
#define GRAY COLOR(15,15,15)
#define RED COLOR(31,0,0)
#define GREEN COLOR(0,31,0)
#define BLUE COLOR(0,0,31)
#define CYAN COLOR(0,31,31)
#define MAGENTA COLOR(31,0,31)
#define YELLOW COLOR(31,31,0)

//Palette
#define PALETTE ((unsigned short *)0x5000000)

//Mode 4 Drawing Functions
void loadPalette(const unsigned short *palette);
void setPixel4(int row, int col, unsigned short colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex);
void drawImage4(int row, int col, int height, int width, const unsigned short *image);
void drawFullScreenImage4(const unsigned short *image);

//Misc. Drawing Functions
void waitForVBlank();
void flipPage();

//=====Input=====//
//Button Register
#define BUTTONS (*(volatile unsigned short *)0x04000130)

//Button Masks
#define BUTTON_A        (1<<0)
#define BUTTON_B        (1<<1)
#define BUTTON_SELECT   (1<<2)
#define BUTTON_START    (1<<3)
#define BUTTON_RIGHT    (1<<4)
#define BUTTON_LEFT     (1<<5)
#define BUTTON_UP       (1<<6)
#define BUTTON_DOWN     (1<<7)
#define BUTTON_R        (1<<8)
#define BUTTON_L        (1<<9)

//Button Macros and Vars.
extern unsigned short oldButtons;
extern unsigned short buttons;
#define BUTTON_HELD(key) (~(BUTTONS) & (key))
#define BUTTON_PRESSED(key) (!(~(oldButtons)&(key)) && (~buttons & (key)))

//========DMA========//
//Struct
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;

//First DMA Register Address
extern DMA *dma;

//Destination Adjustment Bits
//DMA_DST_INC 00: Increment after each transfer (default)
#define DMA_DST_INC (0 << 21)
//DMA_DST_DEC 01: Decrement after each transfer
#define DMA_DST_DEC (1 << 21)
//DMA_DST_FIXED 10: None, address is fixed
#define DMA_DST_FIXED (2 << 21)
//DMA_DST_RESET 11: Increment destination during transfer, then reset
#define DMA_DST_RESET (3 << 21)

//Source Adjustment Bits
//DMA_SRC_INC 00: Increment after each transfer (default)
#define DMA_SRC_INC (0 << 23)
//DMA_SRC_DEC 01: Decrement after each transfer
#define DMA_SRC_DEC (1 << 23)
//DMA_SRC_FIXED 10: None, address is fixed
#define DMA_SRC_FIXED (2 << 23)
//DMA_SRC_REST - forbidden so won't use

//DMA_REPEAT: if set, repeats the copy at each VBlank or HBlank
#define DMA_REPEAT (1<<25)

//Chunk Size
//00: Copy by half-word (16-bits)
#define DMA_16 (0 << 26)
//01: Copy by word (32-bits)
#define DMA_32 (1 << 26)

//Timing Mode
//00: Start immediately (still has a small delay before it takes over)
#define DMA_NOW (0 << 28)
//01: Start at VBlank
#define DMA_AT_VBLANK (1 << 28)
//10: Start at HBlank
#define DMA_AT_HBLANK (2 << 28)
//11: Start at refresh - misleading name

//Interrupt Request
//If set, raise an interrupt when finished
#define DMA_IRQ (1 << 30)

//Enable DMA
//Enable the DMA Transfer for this channel *REQUIRED* for transfer to occur
#define DMA_ON (1 << 31)

//=============Misc=============//
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);

//Logic Functions
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);


#endif