# Est-ce que c'est bientôt le riz noir

> For Benji

![Build Status](https://github.com/jterral/estcequecestbientotleriznoir/actions/workflows/main/badge.svg)
[![License](https://img.shields.io/badge/license-MIT-blue)](https://opensource.org/licenses/MIT)
![VueJS Version](https://img.shields.io/badge/vue.js-3.2.13-33A06F?logo=vue.js)

## 🔨 Project setup

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

### Customize configuration

See [Configuration Reference](https://cli.vuejs.org/config/).

## 🐋 Dockerize

### Local

Build and start container:

```sh
$> docker build -t estcequecestbientotleriznoir .
$> docker run --rm -it -p 8080:80 --name estcequecestbientotleriznoir-app estcequecestbientotleriznoir
```

Execute command:

```sh
$> docker exec -it estcequecestbientotleriznoir-app sh
```

## Azure

```
$ az login
$ az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"
$ export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
$ export ARM_CLIENT_SECRET="00000000-0000-0000-0000-000000000000"
$ export ARM_SUBSCRIPTION_ID="00000000-0000-0000-0000-000000000000"
$ export ARM_TENANT_ID="00000000-0000-0000-0000-000000000000"
```
