require "rubygems"
require "bundler"

Bundler.require

require "webhook_friend"

set server: 'thin', connections: []

require "pusher"

load "config/init.rb" if File.exists? "config/init.rb"

Dir["config/init/**/*.rb"].sort.each { |f| load f }

use WebhookFriend::JSON

run WebhookFriend::App
