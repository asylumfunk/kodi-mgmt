<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mf="http://example.com/mf"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="mf xs saxon"
>

    <xsl:template match="/movie/tag[text()='vehicle']">
        <tag>what / vehicle</tag>
    </xsl:template>

    <xsl:template match="/movie/tag[text()='motor vehicle']">
        <tag>what / vehicle / motor</tag>
    </xsl:template>

    <xsl:template match="/movie/tag[text()='car']">
        <tag>what / vehicle / motor / car</tag>
    </xsl:template>

    <xsl:template match="/movie/tag[text()='18 wheeler']">
        <tag>what / vehicle / motor / truck / 18 wheeler</tag>
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^(car|truck) (crash|wreck|accident)$')]">
        <xsl:analyze-string select="text()" regex="^(car|truck) (crash|wreck|accident)$">
            <xsl:matching-substring>
                <tag>
                    <xsl:value-of select="concat('what / vehicle / motor / ', regex-group(1), ' / crash')" />
                </tag>
            </xsl:matching-substring>
            <xsl:non-matching-substring />
        </xsl:analyze-string>
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^(car|truck) (explosion)$')]">
        <xsl:analyze-string select="text()" regex="^(car|truck) (explosion)$">
            <xsl:matching-substring>
                <tag>
                    <xsl:value-of select="concat('what / vehicle / motor / ', regex-group(1), ' / explosion')" />
                </tag>
            </xsl:matching-substring>
            <xsl:non-matching-substring />
        </xsl:analyze-string>
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^(explod(ed|ing)) (car|truck)$')]">
        <xsl:analyze-string select="text()" regex="^(explod(ed|ing)) (car|truck)$">
            <xsl:matching-substring>
                <tag>
                    <xsl:value-of select="concat('what / vehicle / motor / ', regex-group(1), ' / explosion')" />
                </tag>
            </xsl:matching-substring>
            <xsl:non-matching-substring />
        </xsl:analyze-string>
    </xsl:template>

</xsl:stylesheet>
<!-- vim: tw=1000
-->
