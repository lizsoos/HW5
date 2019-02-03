#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "apple.h"

//Variables
APPLE apples[NUMAPPLES];
BASKET basket;
int applesCollected;
int applesMissed;
int applesActive;

//Initialize Game
void initGame() {

    //initialize players, paddles whatever
    initBasket();

    initApples(); //initialize pool of apples

    //Initialize counters for screen / logic
    applesCollected = 0;
    applesMissed = 0;
    //applesActive = NUMAPPLES;

    //Initialize colors
    unsigned short colors[NUMCOLORS] = {BLACK, BLUE, GREEN, RED, WHITE, GRAY};

    //Load the apple image's colors
    //DMANow(3, applePal, PALETTE, 256);
    loadPalette(applePal);

    //Load custom game colors to the end
    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }

}

//Update game each frame
void updateGame() {

    //Update basket
    updateBasket();

    //Update Apples
    for (int i = 0; i < NUMAPPLES; i++) {
        updateApple(&apples[i]);
    }
        //verify if more apples needed, the add if needed
        //if time for new apple (every 60 frames):
    if (basket.basketTimer == 45) {
            //if apple is not active and active apple is needed, Find an inactive apple and activate it

        for (int i = 0; i < NUMAPPLES; i++) {
            if (!apples[i].active) {

                apples[i].active = 1;
                apples[i].row = 0;
                apples[i].col = (basket.col * 2) / 3 + 4; //something random that follows the basket
                // +4 because you can only draw to even col and width!!!

                basket.basketTimer = 0; //reset timer each new apple
                break;
            }
        }
    }


    //Increase basketTimer each frame
    basket.basketTimer++;
}

void initBasket() {
    basket.row = 120;
    basket.col = 30;
    basket.height = 10;
    basket.width = 30;
    basket.color = BLUEID;
    basket.cdel = 2;
    basket.basketTimer = 0; //So an apple appears immediately
}

void updateBasket() {

    if (BUTTON_HELD(BUTTON_LEFT) && basket.col >= basket.cdel) {

        basket.col -= basket.cdel;

    } else if (BUTTON_HELD(BUTTON_RIGHT)
        && basket.col + basket.width - 1 < SCREENWIDTH - basket.cdel) {
        basket.col += basket.cdel;
    }

}

//Initializing Apples
void initApples() {
    for (int i = 0; i < NUMAPPLES; i++) {
        apples[i].row = apples[i].height * (-1);
        //apples[i].row= 0;
        apples[i].col = 0;
        apples[i].height = 24;
        apples[i].width = 28;
        apples[i].rdel = 1;
        apples[i].cdel = 1;
        apples[i].active = 0;
    }
}

//Update apples and handle their actions each frame
void updateApple(APPLE* a) {
    //if apple is active: move then check for collision
    if (a->active) {

        a->row += a->rdel;
        //Update apples missed
        if (a->row > SCREENHEIGHT) {
            applesMissed++;
            a->active = 0;

        }
        //Check for collision / apples collected
        else if (collision(a->row, a->col, a->height, a->width, basket.row, basket.col, basket.height, basket.width)) {

            //Update apples collected score
            applesCollected++;
            //Put apple back in pool
            a->active = 0;
        }

    }

}

void drawGame() {

    fillScreen4(GREENID);

    drawBasket();

    //Draw apples
    for (int i = 0; i < NUMAPPLES; i++) {
        if (apples[i].active) {
            drawApple(&apples[i]);
        }

    }
}

//Draw the basket
void drawBasket() {
    drawRect4(basket.row, basket.col, basket.height, basket.width, basket.color);
}

//Draw an apple
void drawApple(APPLE* a) {
    if (a->active) {
        drawImage4(a->row, a->col, a->height, a->width, appleBitmap);
    }
}