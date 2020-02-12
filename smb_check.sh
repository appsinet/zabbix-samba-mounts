#!/bin/bash
echo "$(mount | grep $1 | wc -l)"
