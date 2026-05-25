<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mf="http://example.com/mf"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="mf xs saxon"
>

    <xsl:template match="/movie/country[not(text()) or text()='']" priority="3" />
    <xsl:template match="/movie/country[text()=preceding-sibling::country/text()]" priority="2" />
    <xsl:template match="/movie/country">
        <xsl:if test="text() and not(text()='')">
            <country>
                <xsl:choose>
                    <xsl:when test="text()='USA' or text()='United States'">
                        <xsl:text>United States of America</xsl:text>
                    </xsl:when>
                    <xsl:when test="text()='UK'">
                        <xsl:text>United Kingdom</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="text()" />
                    </xsl:otherwise>
                </xsl:choose>
            </country>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^british (film|movie)$')]">
        <country>United Kingdom</country>
        <tag><xsl:value-of select="node()" /></tag>
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^japanese horror (film|movie)$')]">
        <country>Japan</country>
        <genre>Horror</genre>
        <tag><xsl:value-of select="node()" /></tag>
    </xsl:template>
</xsl:stylesheet>
