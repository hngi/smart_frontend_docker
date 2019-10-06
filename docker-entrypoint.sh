#!/bin/sh
npm install
npm run build
serve -s -l 5000 dist
