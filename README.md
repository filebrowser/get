# filebrowser/get

https://filebrowser.org/installation

```sh
# Windows
iwr -useb https://raw.githubusercontent.com/filebrowser/get/master/get.ps1 | iex
filebrowser -r /path/to/your/files

# Unix
curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
filebrowser -r /path/to/your/files

# If you are in trouble with networking issues,
# here is an example to work with mirrors:
export RELEASE_MIRROR='https://gh.api.99988866.xyz/https://github.com'
curl -fsSL https://raw.gitmirror.com/filebrowser/get/master/get.sh | bash
filebrowser -r /path/to/your/files
```
