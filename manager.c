// Program name: "Triangle Assignment". Calculates the 3rd Side of a Triangle given the other information of the Triangle
// Copyright (C) 2025  Brian Ayala

// This file is part of the software program "Triangle Assignment".

// "Triangle Assignment" is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// "Triangle Assignment" is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <hFttps://www.gnu.org/licenses/>. 

// Author information
//   Author name : Brian Ayala
//   Author email: brianayala2050@gnmail.com
//   Author section: 240-09
//   Author CWID : 884641556

// For research purpose only. Please don't copy word for word. Avoid academic dishonesty. 

#include <stdio.h>

extern double triangle();

int main()
{
    printf("\nWelcome to Triangle Program by Brian Ayala\n");
    printf("\nIf there are any errors, please report it to Brian Ayala at brianayala@csu.fullerton.edu\n\n");

    double answer = triangle();

    printf("\nThe answer %f will be saved for when we need to use it\n\nThe program will now return a zero. Bye!\n", answer);
    return 0;
}