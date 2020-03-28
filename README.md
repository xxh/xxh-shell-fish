[xxh](https://github.com/xxh/xxh) entrypoint for [fish-portable](https://github.com/xxh/fish-portable) - statically-linked fish.
## Install
Install from xxh repo:
```
xxh +I xxh-shell-fish
```
Install from any repo:
```
xxh +I xxh-shell-fish+git+https://github.com/xxh/xxh-shell-fish
```
Connect:
```
xxh myhost +s fish
```
To avoid adding `+s` every time use xxh config in `~/.config/xxh/config.xxhc` (`$XDG_CONFIG_HOME`):
```
hosts:
  ".*":                     # Regex for all hosts
    +s: fish
```

## Plugins

**fish xxh plugin** is the set of fish scripts which will be run when you'll use xxh. You can create xxh plugin with your lovely aliases, tools or color theme and xxh will bring them to your ssh sessions.

🔎 [Search xxh plugins on Github](https://github.com/search?q=xxh-plugin-fish&type=Repositories) or [Bitbucket](https://bitbucket.org/repo/all?name=xxh-plugin-fish) or 💡 [Create xxh plugin](https://github.com/xxh/xxh-plugin-fish-sample)
