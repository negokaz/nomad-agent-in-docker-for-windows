#!/bin/bash

consul agent -dev -client=0.0.0.0   | sed --unbuffered -E 's/^\s*/[consul] /' &
nomad  agent -dev -bind=0.0.0.0     | sed --unbuffered -E 's/^\s*/[nomad ] /'
