#!/usr/bin/ruby


class redis::install inherits redis {


	## Global paths
	Exec { path => ['/bin', '/usr/bin'] }



	if($facts['rediscomp'] == 'err'){

			## atualizando o repositorio
			exec { 'Atualizando o repositorio APT': command => 'apt-get update' }

			## instalando libs necessarias
			package {'build-essential': ensure => 'installed'}
			package {'tcl': ensure => 'installed'}
			package {'tcc': ensure => 'installed'}			
			package {'curl': ensure => 'installed'}


			## download do pacote
			exec {'Baixando o redis':
				cwd => '/opt',
				command => 'curl -O http://download.redis.io/redis-stable.tar.gz',
				require => Package['tcl']
			}

			## recompactar o pacote
			exec {'Descompactando o redis':
				cwd => '/opt',
				command => 'tar zxvf redis-stable.tar.gz',
			}

			if($facts['redisi'] == 'false'){

				## compilar o programa
				exec {'Compilando - Make':
					cwd => '/opt/redis-stable',
					command => 'make',
					require => Exec['Descompactando o redis']
				}
				
				exec {'Compilando - Make Install':
					cwd => '/opt/redis-stable',
					command => 'make install',
					require => Exec['Compilando - Make']
				}
			}
	}
}
