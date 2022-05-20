ARG ECR_REGISTRY
FROM $ECR_REGISTRY/dfinity-rosetta-api

RUN apt update
RUN apt install nginx -y

RUN rm -rf /etc/nginx/conf.d/default.conf

COPY scripts/nginx_dev.conf /etc/nginx/conf.d/default.conf
COPY scripts/entrypoint.sh entrypoint.sh
EXPOSE 8080

ENTRYPOINT ["./entrypoint.sh"]