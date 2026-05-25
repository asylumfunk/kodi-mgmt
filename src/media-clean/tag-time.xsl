<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mf="http://example.com/mf"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="mf xs saxon"
>

    <xsl:template match="/movie/tag[matches(text(), '^\d\d\d\d?s$')]">
        <xsl:analyze-string select="text()" regex="^\d+">
            <xsl:matching-substring>
                <tag>
                    <xsl:value-of select="concat('time / period / decade / ', .)" />
                </tag>
            </xsl:matching-substring>
            <xsl:non-matching-substring />
        </xsl:analyze-string>
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^(([^ ]) )?(nostalgi[a|c])$')]">
        <xsl:analyze-string select="text()" regex="^(([^ ]) )?(nostalgi[a|c])$">
            <xsl:matching-substring>
                <tag>
                    <xsl:value-of select="concat('why / nostalgia / ', regex-group(2))" />
                </tag>
            </xsl:matching-substring>
            <xsl:non-matching-substring />
        </xsl:analyze-string>
    </xsl:template>

    <xsl:template match="tag[matches(text(), '^\d\d\d\d?s (film|movie)$')]" />
    <xsl:template match="tag[matches(text(), '^\d+ (day|week|month|year)s? later$')]">
        <xsl:analyze-string select="text()" regex="^\d+ [^ ]+s">
            <xsl:matching-substring>
                <tag>
                    <xsl:value-of select="concat('time / jump / ', substring-after(., ' '), ' / ', substring-before(., ' '))" />
                </tag>
            </xsl:matching-substring>
            <xsl:non-matching-substring />
        </xsl:analyze-string>
        <xsl:analyze-string select="text()" regex="^\d+ [^ ]*[^s ]">
            <xsl:matching-substring>
                <tag>
                    <xsl:value-of select="concat('time / jump / ', substring-after(., ' '), 's / ', substring-before(., ' '))" />
                </tag>
            </xsl:matching-substring>
            <xsl:non-matching-substring />
        </xsl:analyze-string>
    </xsl:template>

    <xsl:template match="/movie/tag[text()='one year later']">
        <tag>
            <xsl:value-of select="concat('time / jump / years / ', '1')" />
        </tag>
    </xsl:template>

    <xsl:template match="tag[matches(text(), '^\d+(th|st|nd|rd)? century$')]">
        <tag>
            <xsl:value-of select="concat('time / period / century / ', substring-before(., ' '))" />
        </tag>
    </xsl:template>

    <xsl:template match="tag[matches(text(), '^year \d+$')]">
        <tag>
            <xsl:value-of select="concat('time / period / year / ', substring-after(., ' '))" />
        </tag>
    </xsl:template>

    <xsl:template match="tag[matches(text(), '^(\d+(st|nd|rd|th)?) birthday$')]">
        <xsl:analyze-string select="text()" regex="^(\d+(st|nd|rd|th)?) birthday$">
            <xsl:matching-substring>
                <tag>
                    <xsl:value-of select="concat('when / occasion / birthday / ', regex-group(1))" />
                </tag>
            </xsl:matching-substring>
            <xsl:non-matching-substring />
        </xsl:analyze-string>
    </xsl:template>

</xsl:stylesheet>
<!-- vim: tw=1000
-->
