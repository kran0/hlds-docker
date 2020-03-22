FROM ubuntu:19.04 AS base

RUN apt update\
# && apt install -y lib32gcc1 libstdc++6 ca-certificates
 && apt install -y lib32gcc1 ca-certificates

FROM base AS builder

ARG STEAM_USER=anonymous
ARG STEAM_PASS=''
ARG METAMOD_VER="1.20"
ARG AMXMOD_VER="1.8.2"
ARG DPROTO_VER="0_9_87--6b4vhmfg85p422tyu1km28jcz64j79d9"

ADD hlds-files /opt/hlds/
WORKDIR /opt/hlds/

RUN apt update\
 && apt install -y curl bash unrar

RUN curl -L "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxC ./steamcmd\
 && chmod +x "./steamcmd/steamcmd.sh"

RUN UPDATE_CMD="./steamcmd/steamcmd_auto.sh +login ${STEAM_USER} ${STEAM_PASS} +force_install_dir /opt/hlds"\
# && ${UPDATE_CMD}\
 && ${UPDATE_CMD} +app_update 90 validate\
 && ${UPDATE_CMD} +app_update 70 validate\
 && ${UPDATE_CMD} +app_update 10 validate\
 && ${UPDATE_CMD} +app_update 90 validate

# remove steamcmd
RUN rm -rvf ./steamcmd
# ---------------------------------

FROM base AS result

COPY --from=builder /opt/ /opt/
WORKDIR /opt/hlds/
ENTRYPOINT [ "/opt/hlds/hlds_run.sh" ]
CMD [ " +log off", "+sv_lan 0" ]
