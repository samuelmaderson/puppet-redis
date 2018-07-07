#!/usr/bin/ruby

class redis {
	include redis::install
	include redis::files
	include redis::user
	include redis::service
}
