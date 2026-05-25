<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mf="http://example.com/mf"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="mf xs saxon"
>

    <xsl:template match="/movie/tag[matches(text(), '^(16)( ?)(mm)(( )(film|camera|movie))?$')]">
        <xsl:analyze-string select="text()" regex="^(16)( ?)(mm)(( )(film|camera|movie))?$">
            <xsl:matching-substring>
                <tag>
                    <xsl:value-of select="concat('meta / medium / film / ', regex-group(1), regex-group(3))" />
                </tag>
            </xsl:matching-substring>
            <xsl:non-matching-substring />
        </xsl:analyze-string>
    </xsl:template>

</xsl:stylesheet>
<!-- vim: tw=1000
-->
