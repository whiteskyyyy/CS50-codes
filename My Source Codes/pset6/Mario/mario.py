from cs50 import get_int


def main():
    while True:
        height = get_int("Height: ")
        column = height
        if height >= 1 and height <= 8:
            break

    for n in range(1, height + 1):
        num_hashes = n
        num_spaces = column - num_hashes

        print(" " * num_spaces, end="")
        print("#" * num_hashes, end="")

        print("  ", end="")

        print("#" * num_hashes)


if __name__ == "__main__":
    main()
