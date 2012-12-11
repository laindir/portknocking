#!/bin/sh

# Copyright 2012 Carl D Hamann
# 
# This file is part of portknocking.
# 
# portknocking is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# portknocking is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with portknocking.  If not, see <http://www.gnu.org/licenses/>.

for i in "$@"; do
nc localhost -w 1 -q 1 "$i" < /dev/null > /dev/null 2> /dev/null &
sleep .05
done
