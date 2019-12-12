#!/bin/bash

mogrify  -format gif -path thumbs -thumbnail 100x100 *.jpg
