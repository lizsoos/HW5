#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "game.h"
#include "applelandscape.h"

//Prototypes
void initialize();
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

//States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

//Variables
unsigned short buttons;
unsigned short oldButtons;

//Text buffer
char buffer[41];

int main() {

    initialize();

    //Game loop
    while(1) {

        //Button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        //State machine
        switch(state) {
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
    }
}

//GBA setup
void initialize() {

    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;

    goToStart();

}

//Start state setup
void goToStart() {
    loadPalette(applelandscapePal);
    //DMANow(3, applelandscapePal, PALETTE, 256);
    drawFullScreenImage4(applelandscapeBitmap);


    drawString4(75, 90, "Press START", WHITEID);

    waitForVBlank();
    flipPage();

    state = START;


}

//Runs each frame of the start state
void start() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        //Initialize game
        initGame();

        //Go to game state
        goToGame();

    }
}

//Game state setup
void goToGame() {
    state = GAME;
}

//Runs each frame of the game state
void game() {
    //Update and draw game each frame
    updateGame();
    drawGame();

    sprintf(buffer, "Apples Collected: %d", applesCollected);
    drawString4(145, 5, buffer, BLACKID);

    sprintf(buffer, "Apples Missed: %d", applesMissed);
    drawString4(145, 130, buffer, BLACKID);

    waitForVBlank();
    flipPage();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    } else if (applesCollected == 10) {
        goToWin();
    } else if (applesMissed == 5) {
        goToLose();
    }

}

//Pause state setup
void goToPause() {

    fillScreen4(GRAYID);
    drawString4(75, 100, "Pause", BLACKID);

    waitForVBlank();
    flipPage();

    state = PAUSE;

}

//Runs each frame of the pause state
void pause() {


    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }

}

//Win state setup
void goToWin() {
    fillScreen4(WHITEID);
    drawString4(75, 100, "YOU WON!", BLACKID);
    drawString4(95, 60, "Press START to play again", BLACKID);

    waitForVBlank();
    flipPage();

    state = WIN;
}

//Runs each frame of the win state
void win() {

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

//Lose state setup
void goToLose() {
    fillScreen4(REDID);
    drawString4(75, 100, "you lose :(", BLACKID);
    drawString4(95, 60, "Press START to play again", BLACKID);

    waitForVBlank();
    flipPage();

    state = LOSE;
}

//Runs each frame of the lose state
void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

