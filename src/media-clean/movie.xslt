<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mf="http://example.com/mf"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:saxon="http://saxon.sf.net/"
    exclude-result-prefixes="mf xs saxon"
>
    <xsl:output indent="yes" method="xml" omit-xml-declaration="no" standalone="yes" saxon:indent-spaces="4"/>
    <xsl:strip-space elements="*" />

    <xsl:param name="update-datetime"/>
    <xsl:param name="current-datetime"/>
    <xsl:param name="created-datetime"/>

    <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />

    <xsl:template match="@*|node()" priority="-2">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()">
                <xsl:sort select="@Name"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>

    <xsl:include href="country.xsl" />
    <xsl:include href="tag-genre.xsl" />
    <xsl:include href="genres.xsl" />
    <xsl:include href="studios.xsl" />
    <xsl:include href="rating.xsl" />
    <!--
    <xsl:include href="tag-budget.xsl" />
    <xsl:include href="tag-meta.xsl" />
    <xsl:include href="tag-remakes-sequels.xsl" />
    <xsl:include href="roles.xsl" />
    <xsl:include href="tag-cleanup.xsl" />
    <xsl:include href="tag-nudity.xsl" />
    <xsl:include href="tag-time.xsl" />
    <xsl:include href="tag-weapons.xsl" />
    <xsl:include href="tag-what-idea.xsl" />
    <xsl:include href="meta.xsl" />
    <xsl:include href="tag-vehicle.xsl" />
    -->

    <xsl:template match="/movie/status | /movie/code | /movie/aired" />
    <xsl:template match="/movie/resume" />
    <xsl:template match="/movie/thumb | /movie/actor/thumb" />
    <xsl:template match="/movie/watched" />

    <!-- votes tmbid
        role surrounded by quotes inside

        actor
        fileinfo
        uniqueid
    -->

    <xsl:template match="/movie/rating[not(text()='')]">
        <xsl:if test="text() and not(text()='')">
            <xsl:copy>
                <xsl:apply-templates select="@*|node()">
                    <xsl:sort select="@Name"/>
                </xsl:apply-templates>
            </xsl:copy>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/ratings">
        <xsl:if test="not(/movie/rating) or not(/movie/rating[text()]) or /movie/rating[text()='']">
            <rating>
                <xsl:value-of select="/movie/ratings/rating[@default='true']/value[text()]" />
            </rating>
        </xsl:if>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()">
                <xsl:sort select="@Name"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/movie/votes">
        <xsl:if test="text() and not(text()='') and not(text()='0')">
            <votes>
                <xsl:value-of select="node()" />
            </votes>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/userrating">
        <xsl:if test="text() and not(text()='') and not(text()='0')">
            <userrating>
                <xsl:value-of select="node()" />
            </userrating>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/top250">
        <xsl:if test="text() and not(text()='') and not(text()='0')">
            <top250>
                <xsl:value-of select="node()" />
            </top250>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/tagline">
        <xsl:if test="text() and not(text()='')">
            <tagline>
                <xsl:value-of select="text()" />
            </tagline>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/outline">
        <xsl:if test="text() and not(text()='')">
            <outline>
                <xsl:value-of select="node()" />
            </outline>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/plot">
        <xsl:if test="(not(../outline) or not(../outline[text()]) or ../outline[text()]='') and (text() and not(text()=''))">
            <outline>
                <xsl:choose>
                    <xsl:when test="contains(text(), '.')">
                        <xsl:value-of select="substring-before(text(), '.')" />
                        <xsl:text>.</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(text(), '?')">
                        <xsl:value-of select="substring-before(text(), '?')" />
                        <xsl:text>?</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(text(), '!')">
                        <xsl:value-of select="substring-before(text(), '!')" />
                        <xsl:text>!</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="text()" />
                    </xsl:otherwise>
                </xsl:choose>
            </outline>
        </xsl:if>
        <xsl:if test="text() and not(text()='')">
            <plot>
                <xsl:value-of select="node()" />
            </plot>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/director">
        <xsl:if test="text() and not(text()='')">
            <director>
                <xsl:value-of select="node()" />
            </director>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/credits">
        <xsl:if test="text() and not(text()='')">
            <credits>
                <xsl:value-of select="node()" />
            </credits>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/runtime">
        <xsl:if test="text() and not(text()='') and not(text()='0')">
            <runtime>
                <xsl:value-of select="node()" />
            </runtime>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/playcount">
        <xsl:choose>
            <xsl:when test="text() and not(text()='')">
                <playcount>
                    <xsl:value-of select="text()" />
                </playcount>
            </xsl:when>
            <xsl:when test="/movie/watched[text()='true']">
                <playcount>
                    <xsl:value-of select="'1'" />
                </playcount>
            </xsl:when>
            <xsl:otherwise>
                <playcount>
                    <xsl:value-of select="'0'" />
                </playcount>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/movie/set">
        <xsl:choose>
            <xsl:when test="./name[text()] and not(./name[text()=''])">
                <set>
                    <xsl:value-of select="./name/text()" />
                </set>
            </xsl:when>
            <xsl:when test="text() and not(text()='')">
                <set>
                    <xsl:value-of select="text()" />
                </set>
            </xsl:when>
            <xsl:otherwise>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/movie/genre[not(text()) or text()='']" priority="3" />
    <xsl:template match="/movie/genre[text()=preceding-sibling::genre/text()]" priority="2" />

    <xsl:template match="/movie/tag[not(text()) or text()='']" priority="3" />
    <xsl:template match="/movie/tag[text()=preceding-sibling::tag/text()]" priority="2" />
    <xsl:template match="/movie/tag" priority="-1">
        <tag>
            <!--<xsl:apply-templates select="@*|node()" mode="step-01" />-->
            <xsl:value-of select="node()" />
        </tag>
    </xsl:template>

    <xsl:template match="/movie/lastplayed">
        <lastplayed>
            <xsl:value-of select="node()" />
        </lastplayed>
    </xsl:template>

    <xsl:template match="/movie/dateadded">
        <!-- TODO: Get value from `stat` or param -->
        <xsl:choose>
            <xsl:when test="text() and not(text()='')">
                <dateadded>
                    <xsl:value-of select="node()" />
                </dateadded>
            </xsl:when>
            <xsl:otherwise>
                <dateadded>
                    <xsl:value-of select="$current-datetime" />
                </dateadded>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/movie/id">
        <xsl:if test="text() and not(text()='')">
            <id>
                <xsl:value-of select="text()" />
            </id>
            <xsl:if test="not(../uniqueid)">
                <xsl:if test="starts-with(text(), 'tt')">
                    <uniqueid default="true" type="imdb">
                        <xsl:value-of select="node()" />
                    </uniqueid>
                </xsl:if>
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/showlink">
        <xsl:if test="text() and not(text()='')">
            <showlink>
                <xsl:value-of select="text()" />
            </showlink>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/trailer">
        <xsl:if test="text() and not(text()='')">
            <trailer>
                <!-- TODO: Standardize Youtube links -->
                <xsl:value-of select="node()" />
            </trailer>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/originaltitle[text()=../title[text()] or not(text()) or text()='']" />
    <xsl:template match="/movie/sorttitle[text()=../title[text()] or not(text()) or text()='']" />
    <xsl:template match="/movie/fanart[not(text())]" />
    <xsl:template match="/movie/generator" />

    <xsl:function name="mf:substring-before-if-contains" as="xs:string?"
                  xmlns:functx="http://www.functx.com">
                    <xsl:param name="arg" as="xs:string?"/>
                      <xsl:param name="delim" as="xs:string"/>

                        <xsl:sequence select="
                           if (contains($arg,$delim))
                              then substring-before($arg,$delim)
                                 else $arg
                                  "/>

                                  </xsl:function>

    <xsl:template match="/movie" priority="-1">
     <xsl:copy>
          <xsl:variable name="vSortingValues" select="',,title,originaltitle,sorttitle,userrating,rating,ratings,outline,plot,tagline,runtime,mpaa,playcount,lastplayed,id,uniqueid,top250,genre,country,set,credits,director,premiered,year,studio,showlink,trailer,fileinfo,studio,actor,dateadded,tag,generator,'" />
      <xsl:apply-templates select="@*|node()">
          <xsl:sort select="string-length(mf:substring-before-if-contains($vSortingValues,concat(',', name(),',')))" order="ascending" data-type="number"/>
      </xsl:apply-templates>
            <!-- MISC -->
            <xsl:if test="not(./mpaa)">
                <mpaa></mpaa>
            </xsl:if>
            <xsl:if test="not(./playcount)">
                <xsl:choose>
                    <xsl:when test="./watched[text()='true']">
                        <playcount>
                            <xsl:value-of select="'1'" />
                        </playcount>
                    </xsl:when>
                    <xsl:otherwise>
                        <playcount>
                            <xsl:value-of select="'0'" />
                        </playcount>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
            <xsl:if test="not(./lastplayed)">
                <lastplayed>
                </lastplayed>
            </xsl:if>
            <xsl:if test="not(./dateadded)">
                <dateadded>
                    <xsl:value-of select="$created-datetime" />
                </dateadded>
            </xsl:if>
            <generator>
                <appname>NFO XSLT</appname>
                <appversion>0.0.0</appversion>
                <datetime>
                    <xsl:choose>
                        <xsl:when test="$update-datetime='' and not(./generator/datetime[text()=''])">
                            <xsl:value-of select="./generator/datetime[text()]" />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$current-datetime" />
                        </xsl:otherwise>
                    </xsl:choose>
                </datetime>
            </generator>

     </xsl:copy>
    </xsl:template>

    <xsl:template match="/movie/title">
        <title>
            <xsl:value-of select="text()" />
        </title>
    </xsl:template>

</xsl:stylesheet>
<!-- vim: tw=1000
-->
