 rrApiOnReady.push(function() {
    try { rrApi.view(<xsl:value-of select="$page-id"/>); 
		} 
		catch(e) {}
    })