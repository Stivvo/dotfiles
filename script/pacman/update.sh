#!/bin/bash

echo "$(cat $1)"
pkg=($(cat $1))

pacaur -Syu --ignore="${pkg[*]}"
