#!/usr/bin/env fish
# xxh Fish Shell configuration file that loads xxh plugins.

set CURRENT_DIR (dirname (realpath (status current-filename)))

for pluginrc_file in $CURRENT_DIR/../../../plugins/*-fish-*/build/pluginrc.fish
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
