FROM dfinity/rosetta-api

RUN apt update
RUN apt install nginx -y

RUN rm -rf /etc/nginx/conf.d/default.conf

COPY scripts/nginx_stage.conf /etc/nginx/conf.d/default.conf
COPY scripts/entrypoint_stage.sh entrypoint.sh
EXPOSE 8080

ENTRYPOINT ["./entrypoint.sh"]