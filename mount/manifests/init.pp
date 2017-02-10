class mount {

	file { '/mount_point':
		ensure	=> directory,
	}

	mount { 'mount_title':
		device  => '/dev/xvdj',
		name	=> '/mount_point',
		ensure  => mounted,
		fstype  => 'ext2',
		options => 'defaults',
		atboot  => true,
		require => File['/mount_point'],
	}
}
