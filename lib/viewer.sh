#!/usr/bin/env bash
# 
# viewer.sh
#
# Copyright (C) 2010 -  Wei-Ning Huang (AZ) <aitjcize@gmail.com>
# All Rights reserved.
#
# This file is part of manpages-cpp.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software Foundation,
# Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#

# viewer.sh is a lauches vim as man page viewer and provides some convinient
# settings
# 

cat "$1" | gunzip | groff -t -m man -Tascii -rLL=$2n -rLT=$2n | col -bx | vim -R -c 'set ft=man iskeyword+=:,=,~,[,],>,* keywordprg=cppman nonu | map q :q<CR> | syn case ignore | syn match manReference "[^ ]\+([1-9][a-z]\=)" | syn match manSectionHeading "^[a-z][a-z_ ]*[a-z]$"' -
