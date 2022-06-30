typedef struct controller_input {
    float co2;
    float temp;
    float light;
    float humidity;
    float soilmos;
    int imCat; // Image category
} conin;

typedef struct controller_output {
    bool fan;
    int water;
    int light; // 0 = off, 1 = blue, 2 = red
    bool warning;
    long waterLastChecked;
} conout;

void createDevice(conin dd, conout dc) {
    readData (dd);
    dc.fan = false; dc.water = 0; dc.light = 0; dc.warning = false; dc.waterLastChecked = 0;
}

void readData(conin dd) {
    // Read data from UART and get classification from ImageClassifier
    return;
}

void controller(conin dd, conout dc){
    switch (dd.imCat) {
        case 1: // Plant needs water
            if (dd.soilmos < 0.7) dc.water = (0.9 - dd.soilmos)*600;
            break;

        case 2: // Plant is flowering
            dc.light = 2;
            dc.warning = true;
            break;

        case 3: case 4: // Plant is dead
            dc.warning = true;
            break;

        case 5: // Plant is dark
            if (dd.light < 2.75) dc.light = 1;
            break;

        default: // Case 0 plant is healthy
            if ((dd.co2>10000|dd.co2<300) & dd.temp>36 & dd.light<2.75 & (dd.humidity>0.95&dd.humidity<0.7) & dd.soilmos<0.4) dc.warning = true;
            else {

                if (dd.co2>10000|dd.co2<300) dc.fan = true;
                else dc.fan = false;

                if (dd.temp>32) {dc.fan = true; dc.water = 100;}
                else {dc.fan = false; dc.water = 0;}

                if (dd.light<2.75) dc.light = 1;
                else dc.light = 0;

                if (dd.humidity<0.75) {dc.water = 100; dc.fan = true;}
                else {dc.fan = false; dc.water = 0;}

                if (dd.soilmos<0.5) dc.water = (0.9 - dd.soilmos)*600;
                else dc.water = 0;
            }
            break;
    }
}

bool waterController(conout dc) {
    long now = Millis();
    if (now - dc.waterLastChecked > 10000){ // Check every 10 seconds
        dc.water -= 1;
        dc.waterLastChecked = now;
        return dc.water>0? 1:0;
    }
}