---
layout: page
title: Caddy Plugins
permalink: /caddy/
---

File Browser and all of its supported static website generators can be used as a Caddy plugin. Right now, it takes form of three different plugins: `http.filemanager`, `http.hugo` (with [Hugo](http://gohugo.io/)) and `http.jekyll` (with [Jekyll](https://jekyllrb.com/)).


## Syntax

```
filemanager [url] [scope] {
    database            path
    no_auth
    recaptcha_key       key
    recaptcha_secret    secret
    alternative_recaptcha
    locale              [en|jp|...]
    allow_commands      [true|false]
    allow_edit          [true|false]
    allow_new           [true|false]
    allow_publish       [true|false]
    commands            cmd1 cmd2...
    css                 path
}
```

+ **url** is the URL path where you will access File Browser. Defaults to `/`.
+ **database** is the path for the database where the settings will be stored.
+ **no_auth** disables the authentication. This should be enabled if you will use another login method (such as `basicauth`).
+ **recaptcha_key** and **recaptcha_secret** are the Site Key and Secret Key used to enable ReCaptcha on login.
+ **alternative_recaptcha** replaces `https://www.google.com` to `https://recaptcha.net` in ReCaptcha handling and serving, especially useful in China. See [https://github.com/filebrowser/filebrowser/issues/366](gh-filebrowser#366) for details. Defaults to `false`.

The following options are mere defaults: they will only be used as the default options for **new users**. After creating a user, its settings should be changed through the Web UI. Although, when using `no_auth` option, the following will define the user permissions.

+ **scope** is the path, relative or absolute, to the directory you want to browse in. Defaults to `./`.
+ **locale** is the default language for new users ([available languages](../configuration/#available-locales)).
+ **allow_commands** is the default value for allow commands option.
+ **allow_edit** is the default value for allow edit option.
+ **allow_new** is the default value for allow new option.
+ **allow_publish** is the default value for allow publish option.
+ **commands** are the default available commands.
+ **css** is the path for a file with a custom stylesheet.

If you're using `http.hugo`, `http.jekyll` or any other plugin which uses File Browser as base, the initial syntax is a little bit different. The **scope** and **url** options are inverted and you should write the name of the plugin instead of **filemanager**.

```
[staticgen] [scope] [url] {
    # options...
}
```


## About the database

By default the database will be stored on [`.caddy`](https://caddyserver.com/docs/automatic-https#dot-caddy) directory, in a sub-directory called `filemanager`. Each file name is an hash of the combination of the host and the base URL.

If you don't set a database path and you change the host or the base URL, your settings will be reset. So it is *highly* recommended to set this option. While you don't set it, you'll receive a warning telling you the value you should use for the current database.

When you set a relative path, it will always be relative to `.caddy/filemanager` directory. Although, you may also use an absolute path if you wish to store the database in other place.
