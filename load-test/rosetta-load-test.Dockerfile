FROM node:16-alpine

WORKDIR /root
COPY rosetta-load-test.js .

ENTRYPOINT ["node","rosetta-load-test.js"]

#docker run --restart=always image_name --hostname rosetta-ogy-stage.origyn.network --port 443 --count 1000