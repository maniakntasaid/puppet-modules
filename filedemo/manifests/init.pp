class filedemo{

	File {
		owner => 'root',
		group => 'finance',
		mode  => '0660',
	}
	
	$homedir = "/root"
	$content = "Contents of first file"

	file {"${homedir}/myfile.txt":
		content => $content,
	}

	file{"${homedir}/myfile2.txt":
		content => "Second file text",
	}
	
	file{"${homedir}/myfile3.txt":
		content => "Contents of third file",
	}

	file{'/root/motd':
		ensure    => present,
		source    => 'puppet:///modules/filedemo/motd',
		owner	  => root,
		group     => root,
		mode 	  => '0644',
		
	}

	file{'/etc/motd':
		ensure   => link,
		target	 => '/root/motd',
	}	
}
