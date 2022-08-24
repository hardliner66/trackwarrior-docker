FROM archlinux

RUN pacman -Syu --needed --noconfirm base-devel expect
RUN pacman -Syu --noconfirm git cmake man

RUN git clone --recursive https://github.com/GothenburgBitFactory/taskshell.git && \
    cd taskshell && cmake -DCMAKE_BUILD_TYPE=release . && make && make install

RUN rm -rf taskshell

RUN git clone https://github.com/hardliner66/trackwarrior /trackwarrior
COPY ./docker /trackwarrior-docker
COPY ./docker/unbuffer /usr/bin/unbuffer

RUN chmod +x /trackwarrior-docker/trackwarrior.sh
RUN chmod +x /usr/bin/unbuffer

RUN pacman -Syu --noconfirm task timew nodejs fish neovim

RUN ln -s /usr/bin/nvim /usr/bin/vi

ENTRYPOINT [ "/trackwarrior-docker/trackwarrior.sh" ]
