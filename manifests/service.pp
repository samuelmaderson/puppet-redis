#!/usr/bin/ruby

class redis::service inherits redis {

	service{ 'redis':
		name => 'redis',
		ensure => 'running',
		enable => true,
		require => Class['redis::files']
	}

	if($facts['servicer'] == 'false'){

		exec{'force redis start': 
			path => '/bin:/usr/bin:', 
			command => '/usr/local/bin/redis-server &',
			require => Class['redis::files']
		}
	}
}
