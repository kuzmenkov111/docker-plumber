#!/bin/bash

su - plumber -c "R -e 'library(plumber); r <- plumb("api.R"); r\$run(port=8000)'"
