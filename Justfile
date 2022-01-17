set dotenv-load := false

default: check

build:
    cargo build

check:
    cargo check
    cargo clippy

reset-vm:
    podman machine stop || true
    podman machine rm --force || true
    podman machine init --cpus 2 --disk-size 64 -m 4069
    podman machine start

build-vm:
    podman build -t zero2prod .