FROM zmkfirmware/zmk-dev-arm:2.4

COPY .bashrc tmp
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN mv /tmp/.bashrc ~/.bashrc

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/bash"]
