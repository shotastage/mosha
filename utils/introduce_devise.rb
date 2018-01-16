#!/usr/bin/env ruby
#
#   introduce_devise.rb
#   mosha
#
#   Copyright (c) 2018 Shota Shimazu. All rights reserved.
#

def main()
    system("rails generate devise:install")
    system("rails g devise User")
    system("rails db:create db:migrate")
    system("rails g devise:views users")
    system("rails generate devise:controllers users")
end

main()
