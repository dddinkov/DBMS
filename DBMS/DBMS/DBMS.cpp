// DBMS.cpp : This file contains the 'main' function. Program execution begins and ends there.

#define DOCTEST_CONFIG_IMPLEMENT
#include "doctest.h"
#include "operation.h"
#include "table.h"
#include <iostream>
#include <sstream>
#include <exception>
#include <Windows.h>

// Simple prompt mode recursive function
void prompt()
{
    std::string input;

    std::getline(std::cin, input);

    if (input == "QUIT;")
    {
        std::cout << "Exitting. Good bye!" << std::endl;
        return;
    }
    
    try
    {
        std::stringstream stream(input);

        Operation* op;

        stream >> op;

        if (op != nullptr)
        {
            op->eval();

            delete op;
        }
        else
        {
            throw std::runtime_error("Something went wrong!");
        }
    }
    catch (std::exception e)
    {
        std::cout << e.what() << std::endl;
    }

    prompt();
}

int main()
{
    doctest::Context context;
    context.run();

    SetConsoleOutputCP(1251);
    SetConsoleCP(1251);
    prompt();
}

// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file
