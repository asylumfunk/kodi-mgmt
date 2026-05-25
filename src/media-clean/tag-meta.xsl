<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mf="http://example.com/mf"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="mf xs saxon"
>

    <xsl:template match="/movie/tag[matches(text(), '^(fictional )?(tv|television) show (with)?in (a )?(film|movie)$')]">
        <tag>plot / tv show / in film</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^film within tv show within a (film|movie)$')]">
        <tag>plot / film / in tv show / in film</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^(film|movie) (with)?in (a )?(film|movie)$') or matches(text(), '^inside a (film|movie)$')]">
        <tag>plot / film / in film</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^play within a (film|movie)$')]">
        <tag>plot / play / in film</tag>
    </xsl:template>

</xsl:stylesheet>
