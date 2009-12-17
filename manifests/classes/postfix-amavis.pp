class postfix::amavis {    
		include amavisd-new
                postfix::config { 
                                  "content_filter": value => "smtp-amavis:[localhost]:10024"; }

}

