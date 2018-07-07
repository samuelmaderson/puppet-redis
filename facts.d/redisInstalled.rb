#!/usr/bin/env ruby

require_relative 'main_redis.rb'

ob = Puppet::Redis.new()
ob.Installed('/usr/local/bin/redis-cli')
