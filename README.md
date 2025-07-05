CS50-codes
This repository, CS50-codes, contains a collection of code solutions, exercises, and projects completed during my journey through Harvard University's CS50x: Introduction to Computer Science. It showcases my progress and understanding of key programming concepts taught throughout the course.

Table of Contents
About

Contents

Technologies

Goals

Disclaimer

How to Use (Installation & Running)

Contact

License

About
CS50-codes is a personal archive of my academic journey through Harvard University's CS50x. It's a comprehensive collection of my work, demonstrating my understanding and implementation of various computer science concepts, from fundamental programming constructs in C to web development basics and database management.

Contents
The folders are organized based on the problem sets (psets) and projects covered in the CS50 curriculum:

pset1/ – C basics: Hello, Mario, Cash, and Credit

pset2/ – Arrays and strings: Caesar, Substitution

pset3/ – Algorithms: Plurality, Runoff, Tideman

pset4/ – Memory: Filter, Recover

pset5/ – Data structures: Speller

pset6/ – Python introduction: Hello, Mario, DNA

pset7/ – SQL: Movies, Finance

final/ – Final project

Games Made/ – Games I've developed with the help of the course

Technologies
This repository utilizes the following languages and tools:

Languages: C, Python, SQL, HTML, CSS, JavaScript

Tools: VS Code, CS50 IDE, Git, Flask

Goals
This repository serves multiple purposes:

Reinforce foundational programming concepts.

Learn problem-solving through code.

Practice real-world application of computer science theories.

Showcase my growth and learning during CS50x.

Disclaimer
This repository is meant for educational and reference purposes. I encourage learners to try solving the problem sets on their own before referring to any solutions here. The solutions provided reflect my understanding at the time of completion and may not be the only or most optimal approaches.

How to Use (Installation & Running)
To explore and run the code in this repository, follow these steps:

1. Clone the Repository
First, clone the repository to your local machine using Git:

git clone [https://github.com/whiteskyyyy/CS50-codes.git](https://github.com/whiteskyyyy/CS50-codes.git)
cd CS50-codes

2. Set Up Your Development Environment
Depending on the language of the code you wish to run, you will need the appropriate compiler or interpreter.

For C programs (.c files):
You will need a C compiler, such as Clang (which CS50x uses) or GCC.

macOS/Linux: Most systems come with Clang or GCC pre-installed. You can check by running clang --version or gcc --version in your terminal. If not installed, you can typically install them via your package manager (e.g., xcode-select --install on macOS, sudo apt install build-essential on Ubuntu).

Windows: Consider installing WSL (Windows Subsystem for Linux) and then a Linux distribution (like Ubuntu) to get access to GCC/Clang, or use a development environment like MinGW.

To compile and run a C program:

# Navigate to the pset folder, e.g., pset1
cd pset1/
# Compile the C file (e.g., hello.c)
clang hello.c -o hello
# Run the compiled program
./hello

For Python programs (.py files):
You will need a Python 3 interpreter.

Installation: Download and install Python from the official Python website. Ensure you add Python to your system's PATH during installation.

Virtual Environments (Recommended): It's good practice to use virtual environments to manage dependencies.

python3 -m venv venv
source venv/bin/activate  # On Windows: .\venv\Scripts\activate

Install Dependencies: If a Python project has a requirements.txt file (e.g., pset7/finance uses Flask), install them:

pip install -r requirements.txt

To run a Python program:

# Navigate to the pset folder, e.g., pset6
cd pset6/
# Run the Python file (e.g., hello.py)
python3 hello.py

For SQL projects (e.g., pset7/movies, pset7/finance):
These projects often interact with SQLite databases.

SQLite: SQLite is usually pre-installed on macOS/Linux. For Windows, you can download the command-line shell from the SQLite website.

Python with SQL: For projects like finance, Python's sqlite3 module is built-in, but you might need to install Flask and cs50 library if not using CS50 IDE:

pip install Flask cs50

To interact with SQL databases or run web applications:

# Navigate to the pset folder, e.g., pset7/movies
cd pset7/movies/
# You can open the database with sqlite3 (if a .db file exists)
sqlite3 your_database.db
# Or run the Python application that uses SQL (e.g., finance)
python3 app.py

For HTML, CSS, and JavaScript files (Games Made/ and potentially final/):
These are typically run directly in a web browser.

Simply open the .html file in your preferred web browser. For more complex projects involving a server (like Flask in pset7/finance or the final/ project if it's a web app), you'll need to run the server-side component first.

Contact
If you have any questions or feedback regarding the code or concepts, feel free to reach out.

LinkedIn: Martinsmk

License
This project is open-source and available under the MIT License.