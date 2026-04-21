#!/bin/sh

set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
IMAGE_NAME=${IMAGE_NAME:-luchko-jekyll-dev}
CONTAINER_NAME=${CONTAINER_NAME:-luchko-jekyll}
DOCKER_BIN=${DOCKER_BIN:-docker}

run_in_container() {
  exec "$DOCKER_BIN" run --rm -it \
    --name "$CONTAINER_NAME" \
    -p 4000:4000 \
    -p 35729:35729 \
    -v "$ROOT_DIR:/workspaces/luchkolab.github.io" \
    -w /workspaces/luchkolab.github.io \
    "$IMAGE_NAME" \
    sh -lc "$1"
}

case "${1:-}" in
  build)
    exec "$DOCKER_BIN" build -t "$IMAGE_NAME" -f "$ROOT_DIR/.devcontainer/Dockerfile" "$ROOT_DIR"
    ;;
  serve)
    run_in_container "bundle config set path vendor/bundle && bundle install && bundle exec jekyll serve --host 0.0.0.0 --livereload --force_polling"
    ;;
  shell)
    run_in_container "bundle config set path vendor/bundle && bundle install && exec sh"
    ;;
  *)
    cat <<'EOF'
Usage: ./scripts/jekyll-container.sh <command>

Commands:
  build   Build the local Jekyll development image
  serve   Run Jekyll with live reload on port 4000
  shell   Open an interactive shell in the container

Optional environment variables:
  DOCKER_BIN      Docker-compatible CLI to use (default: docker)
  IMAGE_NAME      Image tag to build/run (default: luchko-jekyll-dev)
  CONTAINER_NAME  Container name to use (default: luchko-jekyll)
EOF
    exit 1
    ;;
esac