#!/usr/bin/ruby

class redis::files inherits redis {



	file { '/etc/redis':
		
		ensure => directory,
		recurse => true,
		owner => 'redis',
		group => 'redis',
		mode => '0644',
		source => "puppet:///modules/redis/redis",
		require => Class['redis::install']
	}


	file { '/etc/systemd/system/redis.service':
		
		ensure => file,
		mode => '0644',
		owner => root,
		group => root,
		source => 'puppet:///modules/redis/redis.service',
		require => Class['redis::install']
	}


	file { '/var/lib/redis': 
		ensure => directory,
		mode => '0770',
		owner => 'redis',
		group => 'redis',
		notify => Service['redis'],
		require => Class['redis::install']
	}


} 
