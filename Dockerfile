FROM nginx:latest
EXPOSE 80
WORKDIR /app
USER root

COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh ./

RUN apt-get update && apt-get install -y wget unzip iproute2 systemctl &&\
    wget -O temp.zip $(wget -qO- "https://api.github.com/repos/v2fly/v2ray-core/releases/latest" | grep -m1 -o "https.*linux-64.*zip") &&\
    unzip temp.zip v2ray geoip.dat geosite.dat &&\
    mv v2ray v &&\
    rm -f temp.zip &&\
    chmod -v 755 v entrypoint.sh &&\
    echo 'ewogICJsb2ciOiB7CiAgICAibG9nZ2VyIjogIndhcm5pbmciLAogICAgImFjY2VzcyI6ICIvZGV2L251bGwiLAogICAgImVycm9yIjogIi9kZXYvbnVsbCIKICB9LAogICJ\
    kbnMiOiB7CiAgICAic2VydmVycyI6IFsKICAgICAgIjguOC44LjgiLAogICAgICAiOC44LjQuNCIKICAgIF0sCiAgICAiaG9zdHMiOiB7CiAgICAgICJnZW9zaXRlOm5ldGZsaXgiO\
    iAiJHtQUk9YWV9JUH0iLAogICAgICAiZ2Vvc2l0ZTpkaXNuZXkiOiAiJHtQUk9YWV9JUH0iCiAgICB9CiAgfSwKICAiaW5ib3VuZHMiOiBbCiAgICB7CiAgICAgICJwb3J0IjogMTAw\
    MDAsCiAgICAgICJwcm90b2NvbCI6ICJ2bWVzcyIsCiAgICAgICJsaXN0ZW4iOiAiMTI3LjAuMC4xIiwKICAgICAgInNldHRpbmdzIjogewogICAgICAgICJjbGllbnRzIjogWwogICA\
    gICAgICAgewogICAgICAgICAgICAiaWQiOiAiVVVJRCIsCiAgICAgICAgICAgICJhbHRlcklkIjogMAogICAgICAgICAgfQogICAgICAgIF0KICAgICAgfSwKICAgICAgInN0cmVhbV\
    NldHRpbmdzIjogewogICAgICAgICJuZXR3b3JrIjogIndzIiwKICAgICAgICAid3NTZXR0aW5ncyI6IHsKICAgICAgICAgICJwYXRoIjogIi9WTUVTU19XU19QQVRIIgogICAgICAgI\
    H0KICAgICAgfQogICAgfSwKICAgIHsKICAgICAgInBvcnQiOiAyMDAwMCwKICAgICAgInByb3RvY29sIjogInZsZXNzIiwKICAgICAgImxpc3RlbiI6ICIxMjcuMC4wLjEiLAogICAgI\
    CAic2V0dGluZ3MiOiB7CiAgICAgICAgImNsaWVudHMiOiBbCiAgICAgICAgICB7CiAgICAgICAgICAgICJpZCI6ICJVVUlEIgogICAgICAgICAgfQogICAgICAgIF0sCiAgICAgICAgI\
    mRlY3J5cHRpb24iOiAibm9uZSIKICAgICAgfSwKICAgICAgInN0cmVhbVNldHRpbmdzIjogewogICAgICAgICJuZXR3b3JrIjogIndzIiwKICAgICAgICAid3NTZXR0aW5ncyI6IHsKI\
    CAgICAgICAgICJwYXRoIjogIi9WTEVTU19XU19QQVRIIgogICAgICAgIH0KICAgICAgfQogICAgfQogIF0sCiAgIm91dGJvdW5kcyI6IFsKICAgIHsKICAgICAgInByb3RvY29sIjogI\
    mZyZWVkb20iLAogICAgICAic2V0dGluZ3MiOiB7fQogICAgfQogIF0KfQ==' > config

ENTRYPOINT [ "./entrypoint.sh" ]
