<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mf="http://example.com/mf"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="mf xs saxon"
>

    <xsl:template match="/movie/tag[matches(text(), '^american remake of european (film|movie)$')]">
        <tag>subgenre / remake / of european</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^american remake of french (film|movie)$')]">
        <tag>subgenre / remake / of french</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^remake of british (film|movie)$')]">
        <tag>subgenre / remake / of british</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^remake of norwegian (film|movie)$')]">
        <tag>subgenre / remake / of norwegian</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^remake of american (film|movie)$')]">
        <tag>subgenre / remake / of american</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^remake of japanese (film|movie)$')]">
        <tag>subgenre / remake / of japanese</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^remake of swedish (film|movie)$')]">
        <tag>subgenre / remake / of swedish</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^disney live action remake of animated (film|movie)$')]">
        <studio>Disney</studio>
        <tag>subgenre / remake / live-action</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^color remake of black and white (film|movie)$')]">
        <tag>medium / in-color</tag>
        <tag>subgenre / remake / black and white</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^black and white (film|movie)$')]">
        <tag>medium / in-black-and-white</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^remake of cult (film|movie)$')]">
        <tag>subgenre / remake / cult</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^sequel to cult (film|movie)$')]">
        <tag>subgenre / sequel / cult</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^prequel to cult (film|movie)$')]">
        <tag>subgenre / prequel / cult</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^3d sequel to 2d (film|movie)$')]">
        <tag>medium / 3d</tag>
        <tag>subgenre / sequel / 2d</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^direct to video sequel to theatrical (film|movie)$')]">
        <tag>medium / video</tag>
        <tag>subgenre / sequel / theatrical film</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^tv sequel to theatrical (film|movie)$')]">
        <tag>medium / tv</tag>
        <tag>subgenre / sequel / theatrical film</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^parody of cult (film|movie)$')]">
        <tag>subgenre / parody / cult</tag>
    </xsl:template>
    <xsl:template match="/movie/tag[matches(text(), '^two part tv (film|movie)$')]">
        <tag>medium / tv</tag>
        <tag>subgenre / miniseries</tag>
    </xsl:template>

</xsl:stylesheet>
