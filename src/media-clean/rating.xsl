<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mf="http://example.com/mf"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="mf xs saxon"
>

    <xsl:template match="/movie/mpaa">
        <xsl:choose>
            <xsl:when test="text() and not(text()='')">
                <mpaa>
                    <xsl:value-of select="text()" />
                </mpaa>
            </xsl:when>
            <xsl:otherwise>
                <mpaa>
                    <xsl:value-of select="''" />
                </mpaa>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/movie/mpaa[text()='Unrated']" priority="1">
        <mpaa>U</mpaa>
    </xsl:template>

    <xsl:template match="/movie/mpaa[text()='Not Rated']" priority="1">
        <mpaa>NR</mpaa>
    </xsl:template>

    <xsl:template match="/movie/mpaa[matches(text(), '^Rated NC-17(.*)$')]" priority="1">
        <mpaa>NC-17</mpaa>
    </xsl:template>

    <xsl:template match="/movie/mpaa[matches(text(), '^Rated R(.*)$')]" priority="1">
        <mpaa>R</mpaa>
    </xsl:template>

    <xsl:template match="/movie/mpaa[matches(text(), '^Rated PG-13(.*)$')]" priority="1">
        <mpaa>PG-13</mpaa>
    </xsl:template>

    <xsl:template match="/movie/mpaa[matches(text(), '^Rated PG$')]" priority="1">
        <mpaa>PG</mpaa>
    </xsl:template>

    <xsl:template match="/movie/mpaa[matches(text(), '^Rated PG (.*)')]" priority="1">
        <mpaa>PG</mpaa>
    </xsl:template>

    <xsl:template match="/movie/mpaa[matches(text(), '^Rated G(.*)$')]" priority="1">
        <mpaa>G</mpaa>
    </xsl:template>

</xsl:stylesheet>
