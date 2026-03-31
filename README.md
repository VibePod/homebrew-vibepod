# homebrew-vibepod

Official Homebrew tap for [VibePod CLI](https://vibepod.dev) — run and switch AI coding agents locally.

## Installation

```bash
brew tap vibepod/vibepod
brew install vibepod
```

Or in a single command:

```bash
brew install vibepod/vibepod/vibepod
```

Then verify:

```bash
vp version
```

## Usage

```bash
vp list        # See available agents and active workspaces
vp run AGENT   # Start an agent in the current folder
vp ui          # Open the local monitoring UI in your browser
```

Full documentation at [vibepod.dev](https://vibepod.dev).

## Updating

```bash
brew update
brew upgrade vibepod
```

## Uninstalling

```bash
brew uninstall vibepod
brew untap vibepod/vibepod
```

---

## Maintainer: Publishing a New Release

When a new version is released on PyPI, follow these steps to update the formula.

### 1. Get the new tarball URL and SHA256

```bash
VERSION=0.9.1   # replace with new version
URL="https://files.pythonhosted.org/packages/source/v/vibepod/vibepod-${VERSION}.tar.gz"
curl -sL "$URL" | shasum -a 256
```

### 2. Update `Formula/vibepod.rb`

Replace the `url` and `sha256` fields with the new values.

### 3. Regenerate dependency resources

```bash
brew update-python-resources Formula/vibepod.rb
```

This rewrites all `resource` blocks in the formula to match the new version's dependencies.

### 4. Test locally

```bash
brew install --build-from-source Formula/vibepod.rb
brew test vibepod
brew audit --strict --online Formula/vibepod.rb
```

### 5. Commit and push

```bash
git add Formula/vibepod.rb
git commit -m "vibepod ${VERSION}"
git push
```

### Automated updates (optional)

The included GitHub Actions workflow (`.github/workflows/update-formula.yml`) checks PyPI every 6 hours and opens a pull request automatically when a new version is detected. To enable it, the workflow needs the `GITHUB_TOKEN` with write permissions (already available by default in Actions) and the `peter-evans/create-pull-request` action.

---

## Requirements

- macOS (Intel or Apple Silicon)
- [Homebrew](https://brew.sh)
- Python 3.12 (installed automatically by Homebrew if not present)
- Docker (required by VibePod at runtime — install from [docker.com](https://www.docker.com))

## License

MIT
