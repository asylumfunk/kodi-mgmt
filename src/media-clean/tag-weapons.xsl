<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mf="http://example.com/mf"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="mf xs saxon"
>

    <xsl:template match="/movie/tag[text()='.38 snubnose revolver']">
        <tag>weapon / gun / .38 snubnose revolver</tag>
    </xsl:template>

    <xsl:template match="/movie/tag[text()='.38 special']">
        <tag>weapon / gun / .38 special</tag>
    </xsl:template>

    <xsl:template match="/movie/tag[text()='.44 magnum']">
        <tag>weapon / gun / .44 magnum</tag>
    </xsl:template>

    <xsl:template match="/movie/tag[text()='.45 automatic']">
        <tag>weapon / gun / .45 automatic</tag>
    </xsl:template>

    <xsl:template match="/movie/tag[text()='.50 caliber machine gun']">
        <tag>weapon / gun / .50 caliber machine gun</tag>
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^(\d+ gauge) shotgun$')]">
        <xsl:analyze-string select="text()" regex="^(\d+ gauge) shotgun$">
            <xsl:matching-substring>
                <tag>
                    <xsl:value-of select="concat('what / weapon / gun / shotgun / ', regex-group(1))" />
                </tag>
            </xsl:matching-substring>
            <xsl:non-matching-substring />
        </xsl:analyze-string>
    </xsl:template>

</xsl:stylesheet>
<!-- vim: tw=1000
-->
