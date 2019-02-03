//Game structs
//Apple
typedef struct {
    int row;
    int col;
    int height;
    int width;
    int rdel;
    int cdel;
    int active;
} APPLE;

//Basket
typedef struct {
    int row;
    int col;
    int height;
    int width;
    unsigned short color;
    int cdel;
    int basketTimer;
} BASKET;



//Constants
//Pool number = distance traveled(160) / (frames between spawn * pixels moved per frame)
#define NUMAPPLES 10
#define NUMCOLORS 6

enum{BLACKID=(256-NUMCOLORS), BLUEID, GREENID, REDID, WHITEID, GRAYID};
extern unsigned short colors[NUMCOLORS];

//Variables (externs)
extern BASKET basket;
extern APPLE apples[NUMAPPLES];
extern int applesCollected;
extern int applesMissed;
//
//Prototypes
void initGame();
void updateGame();
void initBasket();
void updateBasket();
void initApples();
void updateApple(APPLE *);
void drawGame();
void drawBasket();
void drawApple(APPLE *);