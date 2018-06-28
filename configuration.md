---
layout: page
title: Configuration
permalink: /configuration/
---

File Browser can work either via a command line interface, with flags, or through a configuration file, which can be either in JSON, YAML or TOML.

## Flags

This meaning of each flag is transcendant to the correspondant options in the configuration files. Here are the configurations to the **File Browser itself**:

- ```-a, --address``` is the address to listen to. Defaults to "" (empty string, all of the addresses).
- ```-b, --baseurl``` is the baseURL where File Browser will be available at.
- ```-c, --config``` specifies a configuration file.
- ```-d, --database``` is the path to the database file. Defaults to "./filebrowser.db".
- ```-l, --log``` indicates the error logger; it can be 'stdout', 'stderr' or a file path. Defaults to "stdout".
- ```-p, --port``` is the port to listen to. Defaults 0 (random free port).
- ```--staticgen``` specifies if you want to enable a Static Website Generator (jekyll and hugo are available).
- ```-v, --version``` prints the version of the executable.
- ```--alternative-recaptcha``` replaces `https://www.google.com` to `https://recaptcha.net` in ReCaptcha handling and serving, especially useful in China. See [gh-filebrowser#366](https://github.com/filebrowser/filebrowser/issues/366) for details. Defaults to `false`.
- ```--recaptcha-key``` is the ReCAPTCHA site key. Enables ReCAPTCHA on login.
- ```--recaptcha-secret``` is the ReCAPTCHA secret key. Enables ReCAPTCHA on login.

These options are used to set the default values for new users:

- ```--allow-commands``` is the default value for allow commands option. Defaults to true.
- ```--allow-edit``` is the default value for allow edit option. Defaults to true.
- ```--allow-new``` is the default value for allow new option. Defaults to true.
- ```--commands``` is a space separated string with the available commands for new users. Defaults to "git svn hg".
- ```--no-auth``` disables the authentication. Using this option, the default values will be used for the permissions.
- ```-s, --scope``` is the default scope for new users. Defaults to the working directory.

So, if you wanted to run File Browser on port 80, with the database on `/etc/fm.db` and the default scope to `/data`, you would run:

```
filebrowser --port 80 --database /etc/fm.db --scope /data
```

### Available Locales

Right now, File Browser is available in the following languages:

- `de` - German
- `en` - English
- `es` - Spanish
- `fr` - French
- `ja` - Japanese
- `pt` - Portuguese
- `zh-cn` - Chinese (Simplified)
- `zh-tw` - Chinese (Traditional)

## Configuration File

By default, File Browser will try to find a file named "filebrowser.yaml", "filebrowser.toml" or "filebrowser.json" on the current working directory to use as its configuration file. If you want to use another file, you only need to specify the `-c` flag with its path.

Here is a specimen of a JSON configuration file:

```json
{
  "port": 80,
  "noAuth": false,
  "baseURL": "/admin",
  "address": "127.0.0.1",
  "alternativeReCaptcha": false,
  "reCaptchaKey": "",
  "reCaptchaSecret": "",
  "database": "/path/to/database.db",
  "log": "stdout",
  "plugin": "",
  "scope": "/path/to/my/files",
  "allowCommands": true,
  "allowEdit": true,
  "allowNew": true,
  "commands": [
    "git",
    "svn"
  ]
}
```

In YAML:

```yaml
port: 80
baseURL: /admin
noAuth: false
address: 127.0.0.1
alternativeReCaptcha: false,
reCaptchaKey: ''
reCaptchaSecret: ''
database: "/path/to/database.db"
log: stdout
plugin: ''
scope: "/path/to/my/files"
allowCommands: true
allowEdit: true
allowNew: true
commands:
- git
- svn
```

In TOML:

```toml
port = 80
baseURL = /admin
address = 127.0.0.1
noAuth = false
alternativeReCaptcha = false
reCaptchaKey = ''
reCaptchaSecret = ''
database = "/path/to/database.db"
log = stdout
plugin = ''
scope = "/path/to/my/files"
allowCommands = true
allowEdit = true
allowNew = true
commands = ["git", "svn"]
```
