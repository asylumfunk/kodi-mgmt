<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mf="http://example.com/mf"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="mf xs saxon"
>

    <xsl:template match="/movie/tag[matches(text(), '^slasher (film|movie)$')]">
        <xsl:if test="../genre[not(text()='Slasher')]">
            <genre>Slasher</genre>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^disaster (film|movie)$')]">
        <genre>Disaster</genre>
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^holiday (film|movie)$')]">
        <genre>Holiday</genre>
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^christmas (film|movie)$')]">
        <genre>Christmas</genre>
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^christmas romance (film|movie)$')]">
        <genre>Christmas Romance</genre>
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^horror (film|movie)$')]">
        <genre>Horror</genre>
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^horror b (film|movie)$')]">
        <genre>Horror</genre>
        <tag>b movie</tag>
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^zombie(s)? (film|movie)$')]">
        <xsl:if test="../genre[not(text()='Zombies')]">
            <genre>Zombies</genre>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^boxing (film|movie)$')]">
        <xsl:if test="../genre[not(text()='Sports')]">
            <genre>Sports</genre>
        </xsl:if>
        <!--<tag>subgenre / action / sports / boxing</tag>-->
        <tag><xsl:value-of select="node()" /></tag>
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^monster (film|movie)$')]">
        <genre>Monster</genre>
        <!--<tag>subgenre / horror / monster</tag>-->
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^(.* )?psychotronic (film|movie)$')]">
        <!--<tag>subgenre / psychotronic</tag>-->
        <tag><xsl:value-of select="node()" /></tag>
    </xsl:template>

</xsl:stylesheet>
