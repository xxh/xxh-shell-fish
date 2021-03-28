#!/usr/bin/env fish
# xxh Fish Shell configuration file that loads xxh plugins.
set -U fish_greeting ""
set CURRENT_DIR (dirname (realpath (status current-filename)))

set -l dirs $CURRENT_DIR/../../../plugins/*/build
for pluginrc_file in (find $dirs -type f -name '*pluginrc.fish' -printf '%f\t%p\n' 2>/dev/null | sort -k1 | cut -f2)
  if  test  -f $pluginrc_file 
    set plugin_name (basename (dirname (dirname $pluginrc_file)))

    # Load plugin
    if test "$XXH_VERBOSE" = "1" -o "$XXH_VERBOSE" = "2"
      echo Load plugin $pluginrc_file
    end
    source $pluginrc_file
  end
end

cd ~
