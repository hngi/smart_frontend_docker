# frontend-example-docker

This project is created to help learn docker configurations for frontend projects.

# Prerequisites

Install [node](https://nodejs.org/en/download/). 

Example node install instructions for LTS node 10.x:
```
curl -sL https://deb.nodesource.com/setup_10.x | bash
sudo apt install -y nodejs
```

Check your install with `node -v && npm -v`

Install all packages with `npm install`

## Exercise -> to run the project

To build and serve in production mode: `npm start`
This builds the project to `dist` folder and serves it in port 5000.

You can alternatively build the project with `npm run build` to build the project to `dist` folder and then serve it in any way you want, for example:

To use a npm package called serve to serve the project in port 5000:
- install: `npm install -g serve`
- serve: `serve -s -l 5000 dist`

Test that the project is running by going to <http://localhost:5000>

