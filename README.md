# CodingSpace — Mini

> **Mini variant** of [CodingSpace](https://github.com/red-0130/codingspace). A lightweight Docker image with just the core runtimes — no editor or terminal tooling.

[![Build and Publish Mini Image](https://github.com/red-0130/codingspace/actions/workflows/build-and-publish-mini.yml/badge.svg)](https://github.com/red-0130/codingspace/actions/workflows/build-and-publish-mini.yml)

## Features

Built on `node:lts-trixie-slim` for a minimal footprint. Includes only the essentials for running Node.js and Python workloads.

### Core Runtimes & Languages

- **Node.js LTS**: The backbone of the environment.
- **Bun (latest)**: A fast all-in-one JavaScript runtime & package manager.
- **Python 3**: Pre-installed with `python3`, `uv`, and `uvx` for fast package management.

### System Utilities

- **Build Essentials**: `make`, `gcc`, and friends.
- **OpenSSH Client**: For secure remote connections.
- **Common tools**: `curl`, `wget`, `git`, `procps`, `unzip`.

## Image

The image is published to the GitHub Container Registry and tagged `mini`:

```bash
docker pull ghcr.io/red-0130/codingspace:mini
```

## Getting Started

### Run the Container

```bash
docker run -it ghcr.io/red-0130/codingspace:mini
```

This drops you into a bash shell as the `coder` user with passwordless `sudo`.

### Build Locally

```bash
docker build -t codingspace-mini .
```

## Deployment Options

### Devcontainer / DevPod

Use the `mini` image in your `devcontainer.json`:

```json
{
  "image": "ghcr.io/red-0130/codingspace:mini"
}
```

### Coder Workspace

Reference `ghcr.io/red-0130/codingspace:mini` in your Coder template to spin up a lean workspace without the editor layer.

---

Looking for the full-featured image with Neovim, Zellij, Lazygit, and more? Check out the [`main` branch](https://github.com/red-0130/codingspace).
