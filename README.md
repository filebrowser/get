# filebrowser.github.io

This repo contains the [Jekyll](https://jekyllrb.com/) sources of File Browser projects website.

For local development, the official `jekyll` docker image can be used. Run a container binding the root of the repo and port `4000`:

```
docker run --rm -itv $(pwd):/src -w /src -p 4000:4000 jekyll/jekyll jekyll serve
```

See [Serve Command Options](https://jekyllrb.com/docs/configuration/#serve-command-options), [hub.docker.com/r/jekyll/jekyll](https://hub.docker.com/r/jekyll/jekyll/) and [jekyll/docker](https://github.com/jekyll/docker).
