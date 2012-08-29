#!/bin/bash

rake install['ostia']
rake generate
git commit -am "blog updated"
git push heroku
