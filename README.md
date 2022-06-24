[![main](https://github.com/jterral/estcequecestbientotleriznoir/actions/workflows/main.yml/badge.svg)](https://github.com/jterral/estcequecestbientotleriznoir/actions/workflows/main.yml)
[![License](https://img.shields.io/badge/license-MIT-blue)](https://opensource.org/licenses/MIT)
![VueJS Version](https://img.shields.io/badge/vue.js-3.2.13-33A06F?logo=vue.js)

<br />
<div align="center">
  <a href="https://github.com/jterral/estcequecestbientotleriznoir">
    <img src="public/favicon.ico" alt="Logo" width="48" height="48">
  </a>

  <h3 align="center">Est-ce que c'est bientôt le riz noir ?</h3>

  <p align="center">
    An awesome website for Benjamin!
    <br />
    <br />
    <a href="https://www.estcequecestbientotleriznoir.fr/">View Site</a>
    ·
    <a href="https://github.com/jterral/estcequecestbientotleriznoir/issues">Report Bug</a>
    ·
    <a href="https://github.com/jterral/estcequecestbientotleriznoir/issues">Request Feature</a>
  </p>
</div>

## Getting Started

### Installation

```sh
npm install
```

### Compiles and hot-reloads for development

```sh
npm run serve
```

### Compiles and minifies for production

```sh
npm run build
```

### Lints and fixes files

```sh
npm run lint
```

## Dockerize

### Local

Build and start container:

```sh
docker build -t estcequecestbientotleriznoir .
docker run --rm -it -p 8080:80 --name estcequecestbientotleriznoir-app estcequecestbientotleriznoir
```

## Terraform to Azure

### Connect to Azure

```sh
az login
```

### Terraform

In `terraform` folder.

```sh
terraform init
terraform validate
terraform fmt
terraform plan
```

## License

Distributed under the MIT License. See LICENSE for more information.
