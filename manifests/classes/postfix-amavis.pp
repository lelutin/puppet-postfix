class postfix::amavis {    
		include amavisd-new
        postfix::config { 
                "content_filter": value => "amavis:[127.0.0.1]:10024"; 
        }

}

