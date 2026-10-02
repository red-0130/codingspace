FROM node:lts-trixie-slim

ENV TZ=America/Toronto
ENV CONTAINER=true
ARG USER=coder

RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo curl wget procps git python3\
    ca-certificates unzip openssh-client build-essential make gettext \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && rm -rf /var/lib/apt/lists/*

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /usr/local/bin/
COPY --from=docker.io/oven/bun:debian /usr/local/bin/bun /usr/local/bin/

RUN ln -s /usr/local/bin/bun /usr/local/bin/bunx

# Setup User
RUN groupmod -n ${USER} node && \
    usermod -l ${USER} -d /home/${USER} -m node && \
    echo "${USER} ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/${USER} && \
    chmod 0440 /etc/sudoers.d/${USER}

USER ${USER}

WORKDIR /home/${USER}

RUN mkdir -p ~/.ssh && chmod 700 ~/.ssh && \
    ssh-keyscan github.com >> ~/.ssh/known_hosts 2>/dev/null

CMD ["bash"]
