#!/usr/bin/env bash

{ # this ensures the entire script is downloaded #

  osx-setup_do_install() {

    local YELLOW
    YELLOW='\033[0;33m'
    local BLUE
    BLUE='\033[0;34m'
    local GREY
    GREY='\033[0;90m'
    local NC
    NC='\033[0m'

    echo -e "${GREY}[1/5]${NC} 🚿 Cleaning previous install"
    rm -rf /tmp/master.zip /tmp/osx-setup-master

    echo -e "${GREY}[2/5]${NC} 🚚 Downloading archive"
    curl -s -L -o /tmp/master.zip https://github.com/vspiewak/osx-setup/archive/master.zip > /dev/null

    echo -e "${GREY}[3/5]${NC} 🚧 Uncompress archive"
    unzip -qq -o /tmp/master.zip -d /tmp/

    echo -e "${GREY}[4/5]${NC} 🚀 Launch install"
    /tmp/osx-setup-master/run.sh

    echo -e "${GREY}[5/5]${NC} 🎉 Done"

    echo -e "\n💡 You should restart ;)\n"

  }

  # launch install
  osx-setup_do_install


} # this ensures the entire script is downloaded #
