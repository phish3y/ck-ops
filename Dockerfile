FROM cm2network/steamcmd:root

RUN apt-get update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
    xvfb \
    libxi6 \
    && rm -rf /var/lib/apt/lists/* 

USER ${USER}

RUN bash "${STEAMCMDDIR}/steamcmd.sh" \
        +force_install_dir "/home/steam/ck" \
        +login anonymous \
        +app_update 1007 \
        +app_update 1963720 \
        +quit

CMD [ "bash", "/home/steam/ck/_launch.sh" ]

EXPOSE 27015/udp \
    27016/udp