#!/bin/bash

# Program name: "Triangle Assignment". Calculates the 3rd Side of a Triangle given the other information of the Triangle
# Copyright (C) 2025  Brian Ayala

# This file is part of the software program "Triangle Assignment".

# "Triangle Assignment" is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# "Triangle Assignment" is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <hFttps://www.gnu.org/licenses/>. 

# Author information
#   Author name : Brian Ayala
#   Author email: brianayala2050@gnmail.com
#   Author section: 240-09
#   Author CWID : 884641556

# For research purpose only. Please don't copy word for word. Avoid academic dishonesty. 

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file triangle.asm, output object file triangle.o"
nasm -f elf64 -o triangle.o triangle.asm

# Note: We are using the C compiler gcc for this program
echo "Compile the C file manager.c, output object file manager.o"
gcc -c -m64 -Wall -fno-pie -no-pie -o manager.o manager.c

echo "Link the two object files manager.o and triangle.o, output executable file learn.out"
gcc -m64 -Wall -fno-pie -no-pie -z noexecstack -o learn.out triangle.o manager.o -lm

echo "Next the program "Triangle Assignment" will run"
./learn.out