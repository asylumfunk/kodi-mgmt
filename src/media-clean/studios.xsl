<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mf="http://example.com/mf"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="mf xs saxon"
>

    <xsl:template match="/movie/studio">
        <xsl:if test="text() and not(text()='')">
            <studio>
                <xsl:value-of select="node()" />
            </studio>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^netflix original (film|movie)$')]">
        <studio>Netflix</studio>
    </xsl:template>

    <!--
    <xsl:template match="/movie/tag[matches(text(), '^studio logo seque(s)? (in)?to (film|movie)$')]">
        <tag>
            <xsl:value-of select="'meta / studio logo / seque to film'" />
        </tag>
    </xsl:template>
    -->

</xsl:stylesheet>
