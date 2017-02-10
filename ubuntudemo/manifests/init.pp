class ubuntudemo{
	
	package {'apache2':
		ensure	=> present,
	} 
	
	service {'apache2':
		ensure	=> stopped,
	}

	user {'jeff':
		ensure	=> present;
	} 
}
