#include <cs50.h>
#include <stdio.h>
bool check_validity(long long credit_card_number);
int find_length(long long n);
bool checksum(long long cnn);
void print_credit_card_brand(long long cnn);

int main(void)
{
    long long credit_card_number;
    do
    {
        credit_card_number = get_long_long("Number: ");
    } while (credit_card_number < 0);

    if (check_validity(credit_card_number) == true)
        print_credit_card_brand(credit_card_number);
    else
        printf("INVALID\n");
}

bool check_validity(long long credit_card_number)
{
    int len = find_length(credit_card_number);

    return (len == 13 || len == 15 || len == 16) && checksum(credit_card_number);
}

int find_length(long long n)
{
    int len;
    for (len = 0; n !=0; n/= 10, len++);
    return len;
}

bool checksum(long long cnn)
{
    int sum = 0;
    for (int i = 0; cnn !=0; i++, cnn /=10)
    {
        if (i % 2 == 0)
            sum += cnn % 10;
        else
        {
            int digit = 2 * (cnn % 10);
            sum += digit / 10 + digit % 10;
        }
    }
    return (sum % 10) == 0;

}

void print_credit_card_brand(long long cnn)
{
    if ((cnn >= 34e13 && cnn <35e13) || (cnn >= 37e13 && cnn < 38e13))
        printf("AMEX\n");
    else if (cnn >= 51e14 && cnn < 56e14)
        printf("MASTERCARD\n");
    else if ((cnn >= 4e12 && cnn < 5e12) || (cnn >= 4e15 && cnn < 5e15))
        printf("VISA\n");
    else
        printf("INVALID\n");
}