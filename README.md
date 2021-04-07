<p align="center">  
<a href="https://github.com/xxh/xxh">xxh</a> entrypoint for <a href="https://github.com/xxh/fish-portable">fish-portable</a> - statically-linked portable fish.
</p>

<p align="center">  
If you like the idea of xxh click ⭐ on the repo and <a href="https://twitter.com/intent/tweet?text=Use%20the%20fish%20shell%20wherever%20you%20go%20through%20the%20SSH%20without%20installation%20on%20the%20host.&url=https://github.com/xxh/xxh-shell-fish" target="_blank">tweet</a>.
</p>

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

🔎 [Search xxh plugins on Github](https://github.com/search?q=xxh-plugin-fish&type=Repositories) or [Bitbucket](https://bitbucket.org/repo/all?name=xxh-plugin-fish) or 💡 [Create xxh plugin](https://github.com/xxh/xxh-plugin-fish-example)

## Thanks
* **Frederick Henderson** for plugins support
