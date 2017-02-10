class base::ssh{

	case $osfamily {
		'RedHat' : { $ssh_name='sshd' }
		'Debian' : { $ssh_name='ssh' }
		'default': { warning('OS not supported by puppet') }
		
	}	

#	$ssh_name = $osfamily ? {
#		'RedHat'  => 'sshd',
#		'Debian'  => 'ssh',
#		'default' => 'value',
#	}

	package { 'openssh-package':
		name	=> 'openssh',
		ensure  => present,
	}

	file { '/etc/ssh/sshd_config':
		ensure	=> file,
		owner	=> root,
		group	=> root,
		require	=> Package['openssh-package'],
		source	=> 'puppet:///modules/base/sshd_config',
		notify	=> Service['ssh-service'],
	}

	service {'ssh-service':
		name	   => $ssh_name,
		ensure 	   => running,
		enable 	   => true,
	}
}
