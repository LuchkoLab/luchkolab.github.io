# Development Workflow

This repository supports one shared container definition for two workflows:

- Local development in VS Code Dev Containers on macOS.
- Remote development in GitHub Codespaces.

Both paths use the same files in `.devcontainer/` so the Ruby and Jekyll environment stays consistent.

## Setting-Up and Running Containers

### Local Setup on macOS

The recommended free local runtime is Colima plus a Docker-compatible CLI. The primary local workflow is command-line based, so you do not need to open VS Code or enter the container manually just to run the site.

1. Install the runtime with MacPorts:

```bash
sudo port install colima docker-cli
colima start
```

If your local MacPorts tree exposes the Docker client under a different port name, install the Docker-compatible CLI package available on your system and then start Colima.

1. Build the local development image:

```bash
./scripts/jekyll-container.sh build
```

You can also run `make image` if you prefer a shorter command.

1. Start the site from your host terminal:

```bash
./scripts/jekyll-container.sh serve
```

You can also run `make serve`.

1. Open the forwarded preview on port 4000.

`--force_polling` is included because file watching across mounted folders is more reliable that way on macOS container runtimes.

1. If you want an interactive shell in the same container environment, run:

```bash
./scripts/jekyll-container.sh shell
```

If your Docker-compatible CLI is not named `docker`, set `DOCKER_BIN` when running the script.

```bash
DOCKER_BIN=docker ./scripts/jekyll-container.sh serve
```

### VS Code Dev Containers

If you want the same environment in VS Code, open this repository and run `Dev Containers: Reopen in Container`. The `.devcontainer/` setup uses the same image definition as the command-line workflow above.

### GitHub Codespaces

1. Create a new Codespace from this repository.
1. Wait for the dev container build and the initial `bundle install` to finish.
1. Run the same Jekyll container command:

```bash
./scripts/jekyll-container.sh serve
```

1. Use the forwarded port 4000 preview in Codespaces.


### Notes

- The site currently uses the GitHub Pages gem set from `Gemfile`.
- The lockfile should include Linux platforms so the same dependency set works in local containers and Codespaces.
- If you change `_config.yml`, restart the Jekyll server because Jekyll does not reload that file automatically.

## Viewing the Webpages

With the server running, open your browser to <http://0.0.0.0:4000/>. Changes to the source code (e.g., Markdown files) will update immediately.  Changes to `_config.yml` require the server to be restarted.
