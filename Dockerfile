ARG TAG

FROM hashicorp/terraform:$TAG

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add --no-cache \
        bash \
        jq \
    && touch $HOME/.bashrc \
    && terraform -install-autocomplete

WORKDIR /opt/terraform

ENV PS1="[\[\e[35m\]terraform ($(terraform workspace show))\[\e[m\]] \w \$ "

ENTRYPOINT ["bash"]
