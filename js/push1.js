 rrApiOnReady.push(function() {
    try { rrApi.categoryView(<xsl:value-of select="$page-id"/>); 
        } 
        catch(e) {}
	})