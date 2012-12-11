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

echo -n $(( $(date +%s) / 30 )) | openssl dgst -sha1 -hmac "$(<$1)" | tr 'a-z' 'A-Z' | awk -F '' '{print 16, "i", $1 $2 $3 $4, "p", $5 $6 $7 $8, "p", $9 $10 $11 $12, "p", $13 $14 $15 $16, "p", $17 $18 $19 $20, "p", $21 $22 $23 $24, "p", $25 $26 $27 $28, "p", $29 $30 $31 $32, "p", $33 $34 $35 $36, "p", $37 $38 $39 $40, "p", "q"}' | dc
