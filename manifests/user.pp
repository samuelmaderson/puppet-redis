#!/usr/bin/ruby

class redis::user inherits redis {


	user{ 'Create redis user':
		name => 'redis',
		ensure => 'present'
	}
	
	group{ 'redis':
		name => 'redis',
		ensure => 'present',
		system => true
	}



}
