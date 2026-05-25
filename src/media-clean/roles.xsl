<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mf="http://example.com/mf"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="mf xs saxon"
>

    <xsl:template match="/movie/tag[matches(text(), '^(cgi character in (a )?live action (movie|film))$')]">
        <tag>role / cgi</tag>
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^(cgi animal in (a )?live action (movie|film))$')]">
        <tag>role / cgi / animal</tag>
    </xsl:template>

    <xsl:template match="tag[matches(text(), '^(007|james bond)( character)?$')]">
        <tag>who / name / james bond</tag>
    </xsl:template>

    <xsl:template match="tag[matches(text(), '^(\d+) year old$')]">
        <xsl:analyze-string select="text()" regex="^\d+">
            <xsl:matching-substring>
                <tag>
                    <xsl:value-of select="concat('who / person / age / ', .)" />
                </tag>
            </xsl:matching-substring>
            <xsl:non-matching-substring />
        </xsl:analyze-string>
    </xsl:template>

    <xsl:template match="tag[matches(text(), '^(\d+) year old ([^ ].*)$')]">
        <xsl:analyze-string select="text()" regex="^(\d+) year old ([^ ].*)$">
            <xsl:matching-substring>
                <tag>
                    <xsl:value-of select="concat('who / person / ', regex-group(2), ' / age / ', regex-group(1))" />
                </tag>
            </xsl:matching-substring>
            <xsl:non-matching-substring />
        </xsl:analyze-string>
    </xsl:template>

</xsl:stylesheet>
