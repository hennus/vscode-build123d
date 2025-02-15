FROM registry.fedoraproject.org/fedora-minimal:latest
ADD ./install_vsix.sh /install_vsix.sh
ADD ./install-cadquery.sh /install-cadquery.sh
ADD ./watch-dir.sh /watch-dir.sh
ADD ./requirements.txt /requirements.txt
RUN bash /install-cadquery.sh
ADD ./entrypoint.sh /entrypoint.sh
ADD ./settings.json /root/.local/share/code-server/User/settings.json
ADD ./launch.json /root/.local/share/code-server/User/launch.json

VOLUME /data
WORKDIR /data
EXPOSE 8080

CMD ["/bin/bash", "/entrypoint.sh"]