#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>
#include<cs50.h>




#define JAR 512


typedef unsigned char BYTE;

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        fprintf(stderr, "Useage ./recover image name\n");
        return 1;
    }


    char *card = argv[1];


    FILE *raw_data = fopen(card, "r");

    if (raw_data == NULL)
    {
        fprintf(stderr, "Could not open %s.\n", card);
        return 2;
    }

    BYTE buffer[JAR];

    int counter;
    counter = 0;

    FILE *img;

    char picha[8];

    while (fread(buffer, sizeof(buffer), 1, raw_data) == 1)
    {

        if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff && (buffer[3] & 0xf0) == 0xe0)
        {
            if (counter > 0)
            {
                fclose(img);

                sprintf(picha, "%03d.jpg", counter);
                counter += 1;

                img = fopen(picha, "w");

                fwrite(buffer, sizeof(buffer), 1, img);
            }
            if (counter == 0)
            {
                sprintf(picha, "%03d.jpg", counter);
                counter += 1;

                img = fopen(picha, "w");

                fwrite(buffer, sizeof(buffer), 1, img);
            }



        }
        else if (counter > 0)
        {

            fwrite(buffer, sizeof(buffer), 1, img);
        }


    }


    fclose(img);
    fclose(raw_data);
    return 0;
}