<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mf="http://example.com/mf"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="mf xs saxon"
>

    <xsl:template match="/movie/genre" priority="0">
        <xsl:if test="text() and not(text()='')">
            <genre>
                <xsl:value-of select="node()" />
            </genre>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/genre[text()='Independent']">
        <xsl:choose>
            <xsl:when test="../tag[translate(text(), $uppercase, $lowercase)='independent film']" />
            <xsl:otherwise>
                <tag>
                    <xsl:value-of select="'independent film'" />
                </tag>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/movie/genre[text()='TV Movie']">
        <xsl:choose>
            <xsl:when test="../tag[translate(text(), $uppercase, $lowercase)='tv movie']" />
            <xsl:otherwise>
                <tag>
                    <xsl:value-of select="'tv movie'" />
                </tag>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/movie/genre[text()='Mystery']">
        <xsl:choose>
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='spy']" />
            <xsl:otherwise>
                <genre>
                    <xsl:value-of select="text()" />
                </genre>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/movie/genre[text()='Torture']">
        <xsl:choose>
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='body horror']" />
            <xsl:otherwise>
                <genre>
                    <xsl:value-of select="'Body Horror'" />
                </genre>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/movie/genre[text()='Action']">
        <xsl:choose>
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='adventure']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='disaster']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='heist']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='survival']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='vendetta']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='sport']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='climbing']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='martial arts']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='kung fu']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='driving']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='spy']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='superhero']" />
            <xsl:otherwise>
                <genre>
                    <xsl:value-of select="text()" />
                </genre>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/movie/genre[text()='Crime']">
        <xsl:choose>
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='heist']" />
            <xsl:otherwise>
                <genre>
                    <xsl:value-of select="text()" />
                </genre>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/movie/genre[text()='Drama']">
        <xsl:choose>
            <xsl:when test="../genre[text()='Romance']" />
            <xsl:when test="../genre[text()='RomCom']" />
            <xsl:when test="../genre[text()='Romantic Comedy']" />
            <xsl:when test="../genre[text()='Christmas Romance']" />
            <xsl:when test="../genre[text()='Christmas Romantic Comedy']" />
            <xsl:otherwise>
                <genre>
                    <xsl:value-of select="text()" />
                </genre>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/movie/genre[text()='Romance']">
        <xsl:choose>
            <xsl:when test="../genre[text()='RomCom']" />
            <xsl:when test="../genre[text()='Romantic Comedy']" />
            <xsl:when test="../genre[text()='Christmas']" />
            <xsl:when test="../genre[text()='Christmas Romance']" />
            <xsl:when test="../genre[text()='Christmas Romantic Comedy']" />
            <xsl:when test="../genre[text()='Comedy']">
                <genre>Romantic Comedy</genre>
            </xsl:when>
            <xsl:otherwise>
                <genre>
                    <xsl:value-of select="text()" />
                </genre>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/movie/genre[text()='Comedy']">
        <xsl:choose>
            <xsl:when test="../genre[text()='RomCom']" />
            <xsl:when test="../genre[text()='Romantic Comedy']" />
            <xsl:when test="../genre[text()='Christmas Romantic Comedy']" />
            <xsl:otherwise>
                <genre>
                    <xsl:value-of select="text()" />
                </genre>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/movie/genre[text()='Christmas']">
        <xsl:choose>
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='christmas romance']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='christmas romantic comedy']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='halloween']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='holday horror']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='romance'] and ../genre[translate(text(), $uppercase, $lowercase)='comedy']">
                <genre>Christmas Romantic Comedy</genre>
            </xsl:when>
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='romantic comedy']">
                <genre>Christmas Romantic Comedy</genre>
            </xsl:when>
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='romance']">
                <genre>Christmas Romance</genre>
            </xsl:when>
            <xsl:otherwise>
                <genre>
                    <xsl:value-of select="text()" />
                </genre>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/movie/genre[text()='Holiday']">
        <xsl:choose>
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='christmas']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='christmas romance']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='christmas romantic comedy']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='halloween']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='holday horror']" />
            <xsl:otherwise>
                <genre>
                    <xsl:value-of select="text()" />
                </genre>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!--
    <xsl:template match="/movie/genre[text()='Horror']">
        <xsl:choose>
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='creature']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='kaiju']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='haunted']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='paranormal']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='monster']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='slasher']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='torture']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='zombie']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='zombies']" />
            <xsl:otherwise>
                <genre>
                    <xsl:value-of select="text()" />
                </genre>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    -->

    <xsl:template match="/movie/genre[text()='Music']">
        <xsl:choose>
            <xsl:when test="../genre[text()='Musical']" />
            <xsl:otherwise>
                <genre>
                    <xsl:value-of select="text()" />
                </genre>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/movie/genre[text()='Science-Fiction']">
        <xsl:choose>
            <xsl:when test="../genre[text()='Sci-Fi']" />
            <xsl:otherwise>
                <genre>
                    <xsl:value-of select="'Sci-Fi'" />
                </genre>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!--
    <xsl:template match="/movie/genre[text()='Sci-Fi']">
        <xsl:choose>
            <xsl:when test="../genre[text()='Cyberpunk']" />
            <xsl:otherwise>
                <genre>
                    <xsl:value-of select="text()" />
                </genre>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    -->

    <xsl:template match="/movie/genre[text()='Sport']">
        <genre>
            <xsl:value-of select="'Sports'" />
        </genre>
        <xsl:choose>
            <xsl:when test="../tag[translate(text(), $uppercase, $lowercase)='sports']" />
            <xsl:otherwise />
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/movie/genre[text()='Synchronicity']">
        <xsl:choose>
            <xsl:when test="../tag[translate(text(), $uppercase, $lowercase)='synchronicity']" />
            <xsl:otherwise>
                <tag>
                    <xsl:value-of select="'synchronicity'" />
                </tag>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/movie/genre[text()='Thriller']">
        <xsl:choose>
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='action']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='adventure']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='disaster']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='survival']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='vendetta']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='sport']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='climbing']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='martial arts']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='kung fu']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='driving']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='spy']" />
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='superhero']" />
            <xsl:otherwise>
                <genre>
                    <xsl:value-of select="text()" />
                </genre>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/movie/genre[text()='Food&amp;Drug']">
        <xsl:choose>
            <xsl:when test="../genre[translate(text(), $uppercase, $lowercase)='medicine']" />
            <xsl:otherwise>
                <genre>
                    <xsl:value-of select="'Medicine'" />
                </genre>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^lgbtq holiday (film|movie)$')]">
        <genre>Holiday</genre>
        <tag>lgbtq movie</tag>
    </xsl:template>

    <xsl:template match="/movie/tag[matches(text(), '^concert (film|movie)$')]">
        <genre>Concert</genre>
    </xsl:template>

</xsl:stylesheet>
