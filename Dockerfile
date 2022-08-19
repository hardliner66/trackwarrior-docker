FROM archlinux

RUN pacman -Syu --needed --noconfirm base-devel
RUN pacman -S --noconfirm git cmake

RUN git clone --recursive https://github.com/GothenburgBitFactory/taskshell.git && \
    cd taskshell && cmake -DCMAKE_BUILD_TYPE=release . && make && make install

RUN rm -rf taskshell

RUN pacman -S --noconfirm task timew nodejs fish

RUN git clone https://github.com/hardliner66/trackwarrior /trackwarrior
COPY ./docker /trackwarrior-docker

RUN chmod +x /trackwarrior-docker/trackwarrior.sh

ENTRYPOINT [ "/trackwarrior-docker/trackwarrior.sh" ]
