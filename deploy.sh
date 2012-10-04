#!/bin/bash

rake install['ostia']
rake generate
git add .
git commit -m "blog updated"
git push 