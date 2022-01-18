set dotenv-load := false

default: check

build:
    cargo build

check:
    cargo check
    cargo clippy

vm-build:
    docker build -t zero2prod .

vm-run:
    docker run -p 8000:8000 zero2prod