#!/usr/bin/env ruby
#
#   setup.rb
#   mosha
#
#   Copyright (c) 2018 Shota Shimazu. All rights reserved.
#

def log(str)
    puts "mosha SETUP: " + str
end


def install_requirements()
    log("Installing required gems...")
    system("bundle install --path vendor/bundle")
end


def main()
    log("STARTING SETUP TOOL")
    install_requirements()
end

main()
