#!/usr/bin/env ruby

module Puppet

	class Redis


		def Installed(pathfile)

			if File.exist?(pathfile)

				print('redisi=true')

			else
				print('redisi=false')
			end
		end


		def Service(port)

			system("nc -v -z localhost #{port}")
			
			if $?.exitstatus == 0
				print('servicer=true')
			else
				print('servicer=false')
			end
		end
	end

end

