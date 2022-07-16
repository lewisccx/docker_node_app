FROM node:18-alpine

WORKDIR /app

COPY package.json /app

ARG NODE_ENV

RUN if [ "$NODE_ENV" = "development" ]; \
        then npm install; \
        else npm install --only=production; \
        fi

COPY . /app

# ENV NODE_APP_NAME=myName
ENV PORT 3000

EXPOSE $PORT

CMD ["node", "index.js"]

# docker build -t node_image:dev -f Dockerfile.dev .
# docker run --name node_app -p 3000:3000 --rm -d node_image:dev
# docker exec -it node_app sh
## printenv

# dev setup
# bind mount: "-v C:\Users\1700559\Documents\docker\samples\node_app\src:/app/src
# docker run --name node_app -p 3000:3000 --rm -d -v C:\Users\1700559\Documents\docker\samples\node_app:/app node_image:dev
# in Powershell
# docker run --name node_app -p 3000:3000 --rm -d -v ${pwd}:/app node_image:dev
# In Commandline
# docker run --name node_app -p 3000:3000 --rm -d -v %cd%:/app node_image:dev
# In Linux
# docker run --name node_app -p 3000:3000 --rm -d -v $(pwd):/app node_image:dev
# Enable code live update on Windows
# npm install nodemon --save-dev
# "scripts": {
#    ...,
#    "start": "node index.js",
#    "dev": "nodemon -L index.js"
#  },

# Prevent node_modules from removal in container since bind mount is in use
# docker run --name node_app -p 3000:3000 --rm -d -v %cd%:/app -v /app/node_modules node_image:dev

# make your bind mount read-only 
# docker run --name node_app -p 3000:3000 --rm -d -v %cd%:/app:ro -v /app/node_modules node_image:dev

# Passing environment variables
# docker run --name node_app -p 3000:4000 --rm -d -e PORT=4000 -v %cd%:/app:ro -v /app/node_modules node_image:dev
# OR
# docker run --name node_app -p 3000:4000 --rm -d --env-file env/.dev.env -v %cd%:/app:ro -v /app/node_modules node_image:dev

# Passing dockerfile name in case you change default "Dockerfile" name
# docker build -t node_image:dev -f Dockerfile.dev .