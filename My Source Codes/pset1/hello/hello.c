#include <cs50.h>
#include <stdio.h>

int main(void)
{
    string name = get_string("What is your name?\n");
    printf("hello, %s\n", name);
    printf("What a beutiful name %s\n", name);
}