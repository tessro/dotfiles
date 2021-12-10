#!/bin/bash

set -e

excludes="install.sh README.md LICENSE"

function usage {
  echo "usage: install.sh [-y]"
  exit 1
}

# This starts off falsy, and becomes true with `-y` or choice `a`
replace_all=

while getopts ":y" opt; do
  case $opt in
    y)
      replace_all=true
      ;;
    \?)
      usage
      ;;
  esac
done

function sync_submodules {
  git submodule init
  git submodule update
}

function should_skip {
  for e in $excludes ; do
    [[ "$1" == "$e" ]] && return
  done
}

function install {
  local choice

  for src in * ; do
    should_skip $src && continue

    local dest="$HOME/.$src"
    local pretty_dest="~/.$src"
    if [ -a $dest ]; then
      if [ $src -ef $dest ] ; then
        echo "identical $pretty_dest"
      else
        if [ "$replace_all" = true ] ; then
          replace_file $src
        else
          echo -n "overwrite $pretty_dest? [ynaq] "
          read choice
          choice=$(echo $choice | tr -d "[:space:]")
          case $choice in
            a)
              replace_all=true
              replace_file $src
              ;;
            y)
              replace_file $src
              ;;
            q)
              exit
              ;;
            *)
              echo "skipping $pretty_dest"
              ;;
          esac
        fi
      fi
    else
      replace_file $src
    fi
  done
}

function replace_file {
  local src="$PWD/$1"
  local dest="$HOME/.$1"
  local pretty_dest="~/.$1"

  [ -a $dest ] && rm -rf $dest

  echo "linking $pretty_dest"
  ln -s $src $dest
}

sync_submodules
install
