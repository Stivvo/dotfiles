#!/bin/bash

pkg="$(tr "\n" " " < packages.txt)"
echo $pkg
pacaur -S --needed "$pkg"
