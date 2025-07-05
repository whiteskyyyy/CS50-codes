from cs50 import get_int
from math import floor


def main():
    first_digit = 0
    second_digit = 0
    digits = 0
    sum_first = 0
    sum_second = 0
    cnn = get_int("Number: ")

    while cnn > 0:
        second_digit = first_digit
        first_digit = cnn % 10

        if digits % 2 == 0:
            sum_second += first_digit
        else:
            multiple = 2 * first_digit
            sum_first += (multiple // 10) + (multiple % 10)

        cnn //= 10
        digits += 1

    is_valid = (sum_second + sum_first) % 10 == 0
    first_two_digits = (first_digit * 10) + second_digit

    if first_digit == 4 and digits >= 13 and digits <= 16 and is_valid:
        print("VISA\n")
    elif first_two_digits >= 51 and first_two_digits <= 55 and digits == 16 and is_valid:
        print("MASTERCARD\n")
    elif (first_two_digits == 34 or first_two_digits == 37) and digits == 15 and is_valid:
        print("AMEX\n")
    else:
        print("INVALID\n")


if __name__ == "__main__":
    main()