<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mf="http://example.com/mf"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="mf xs saxon"
>

    <xsl:template match="/movie/tag[matches(text(), '^low budget( (film|movie))?$')]">
        <tag>budget / low</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^low budget sci fi (film|movie)$')]">
        <genre>Sci-Fi</genre>
        <tag>budget / low</tag>
    </xsl:template>

</xsl:stylesheet>
