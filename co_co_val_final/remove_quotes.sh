#!/usr/bin/env bash

for i in pwd/tree_files/*treefile\"; do mv -v "$i" $(echo $i | sed "s/[ \"\']/_/g"); done