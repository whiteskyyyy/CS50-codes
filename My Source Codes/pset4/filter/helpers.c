#include "helpers.h"
#include <math.h>
// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            RGBTRIPLE boxes = image[i][j];
            int all = round((boxes.rgbtBlue + boxes.rgbtGreen + boxes.rgbtRed) / 3.0);
            image[i][j].rgbtRed = image[i][j].rgbtGreen = image[i][j].rgbtBlue = all;
        }
    }
}

int limit(int value)
{
    return value > 255 ? 255 : value;
}
// Convert image to sepia
void sepia(int height, int width, RGBTRIPLE image[height][width])
{
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            RGBTRIPLE boxes = image[i][j];
            int originalRed = boxes.rgbtRed;
            int originalBlue = boxes.rgbtBlue;
            int originalGreen = boxes.rgbtGreen;
            image[i][j].rgbtRed = limit(round(0.393 * originalRed + 0.769 * originalGreen + 0.189 * originalBlue));
            image[i][j].rgbtBlue = limit(round(0.272 * originalRed + .534 * originalGreen + 0.131 * originalBlue));
            image[i][j].rgbtGreen = limit(round(0.349 * originalRed + .686 * originalGreen + 0.168 * originalBlue));
        }
    }
}

// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    int temp[3];
    for (int j = 0; j < height; j++)
    {
        for (int i = 0; i < width / 2; i++)
        {
            temp[0] = image[j][i].rgbtBlue;
            temp[1] = image[j][i].rgbtRed;
            temp[2] = image[j][i].rgbtGreen;

            image[j][i].rgbtBlue = image[j][width - i - 1].rgbtBlue;
            image[j][i].rgbtRed = image[j][width - i - 1].rgbtRed;
            image[j][i].rgbtGreen = image[j][width - i - 1].rgbtGreen;

            image[j][width - i - 1].rgbtBlue = temp[0];
            image[j][width - i - 1].rgbtRed = temp[1];
            image[j][width - i - 1].rgbtGreen = temp[2];
        }
    }
}

// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
{
    int sumBlue;
    int sumGreen;
    int sumRed;
    float counter;

    RGBTRIPLE temp[height][width];

    for (int i = 0; i < width; i++)
    {
        for (int j = 0; j < height; j++)
        {
            sumBlue = 0;
            sumGreen = 0;
            sumRed = 0;
            counter = 0.00;


            for (int k = -1; k < 2; k++)
            {
                if (j + k < 0 || j + k > height - 1)
                {
                    continue;
                }

                for (int h = -1; h < 2; h++)
                {
                    if (i + h < 0 || i + h > width - 1)
                    {
                        continue;
                    }

                    sumBlue += image[j + k][i + h].rgbtBlue;
                    sumGreen += image[j + k][i + h].rgbtGreen;
                    sumRed += image[j + k][i + h].rgbtRed;
                    counter++;
                }
            }


            temp[j][i].rgbtBlue = round(sumBlue / counter);
            temp[j][i].rgbtGreen = round(sumGreen / counter);
            temp[j][i].rgbtRed = round(sumRed / counter);
        }
    }


    for (int i = 0; i < width; i++)
    {
        for (int j = 0; j < height; j++)
        {
            image[j][i].rgbtBlue = temp[j][i].rgbtBlue;
            image[j][i].rgbtGreen = temp[j][i].rgbtGreen;
            image[j][i].rgbtRed = temp[j][i].rgbtRed;
        }
    }
}
