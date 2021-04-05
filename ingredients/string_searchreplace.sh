#!/usr/bin/env bash

# Description: Demostrates the use of search and replace
# Author: Maros Kukan

f="mytxt.txt"

# Replaces first occurence txt with jpg -> myjpg.txt
f1=${f/txt/jpg}

# Replaces last occurence txt with jpg -> mytxt.jpg
f2=${f/%txt/jpg}

# Replaces all occurences txt with jpg -> myjpg.jpg
f3=${f//txt/jpg}

# Removes all occurences of txt -> my.
f4=${f//txt/}

# Removes last occurence of txt -> mytxt.
f5=${f/%txt/}
f6=${f%txt}

# Replaces every y or x with a (single occurance)
f7=${f/[yx]/a}

# Replaces every y or x with a (all occurances)
f8=${f//[yx]/a}