class ntp::file{
	
	$template = $ntp::params::template

	file { '/etc/ntp.conf':
		ensure	=> file,
		require	=> Package['ntp'],
		content	=> template("ntp/${template}.erb"),
			

	}

}
