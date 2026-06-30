# Installing Visual Studio Code Binary Builds

This note describes how to install both the Visual Studio Code GUI build and the standalone Visual Studio Code CLI build under:

```bash
/util/opt/visual-studio-code/
```

Using ver. 1.124.2 as an exmaple

The GUI build is installed as:
```bash
/util/opt/visual-studio-code/1.124.2
```

The standalone CLI build is installed as:
```bash
/util/opt/visual-studio-code/1.124.2-cli
```


> Note: The `microsoft/vscode` GitHub release page is useful for checking release tags and source archives. For the Microsoft Visual Studio Code GUI binary, use the official Visual Studio Code download/update endpoint instead.

## 1. Install the Visual Studio Code GUI Version

Set the version and installation prefix:

```bash
VERSION=1.124.2
PREFIX=/util/opt/visual-studio-code/${VERSION}
```

Create a temporary build directory:

```bash
mkdir -p /tmp/vscode-install
cd /tmp/vscode-install
```

Download the Linux x64 GUI tarball:

```bash
curl -L \
  "https://update.code.visualstudio.com/${VERSION}/linux-x64/stable" \
  -o vscode-linux-x64-${VERSION}.tar.gz
```
Create the install directory:

```bash
mkdir -p "${PREFIX}"
```
Extract the archive:

```bash
tar -xzf vscode-linux-x64-${VERSION}.tar.gz --strip-components=1 -C "${PREFIX}"
```
Expected layout:

```text
/util/opt/visual-studio-code/1.124.2/
├── code
├── bin/
│   └── code
├── resources/
│   └── app/
│       └── out/
│           └── cli.js
└── ...
```

## 2. Install the Standalone Visual Studio Code CLI

Set the version and installation prefix:

```bash
VERSION=1.124.2
PREFIX=/util/opt/visual-studio-code/${VERSION}-cli
```

Create a temporary build directory:

```bash
mkdir -p /tmp/vscode-cli-install
cd /tmp/vscode-cli-install
```

Download the standalone CLI tarball:

```bash
curl -L \
  "https://update.code.visualstudio.com/${VERSION}/cli-linux-x64/stable" \
  -o vscode-cli-linux-x64-${VERSION}.tar.gz
```

Create the install directory:

```bash
mkdir -p "${PREFIX}"
```

Extract the standalone CLI archive:

```bash
tar -xzf vscode-cli-linux-x64-${VERSION}.tar.gz -C "${PREFIX}"
```

Expected layout:

```text
/util/opt/visual-studio-code/1.124.2-cli/
└── code
```

## 3. Create the corrsponding module loading script