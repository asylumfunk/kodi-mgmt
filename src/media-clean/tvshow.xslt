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
    <xsl:param name="latest-lastplayed"/>

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
    <!--
    <xsl:include href="tag-genre.xsl" />
    <xsl:include href="genres.xsl" />
    <xsl:include href="studios.xsl" />
    <xsl:include href="rating.xsl" />
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

    <xsl:template match="/tvshow/displayepisode | /tvshow/displayseason" />
    <xsl:template match="/tvshow/outline" />
    <xsl:template match="/tvshow/code | /tvshow/aired" />
    <xsl:template match="/movie/status | /movie/code | /movie/aired" />
    <xsl:template match="/movie/resume | /tvshow/resume | /episodedetails/resume" />
    <xsl:template match="/movie/thumb | /tvshow/thumb | /episodedetails/thumb | /movie/actor/thumb | /tvshow/actor/thumb | /episodedetails/actor/thumb" />
    <!--
    <xsl:template match="/movie/watched" />
    -->

    <xsl:template match="/episodedetails/studio">
        <xsl:if test="text() and not(text()='')">
            <studio>
                <xsl:value-of select="text()" />
            </studio>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/episodedetails/code">
        <xsl:if test="text() and not(text()='')">
            <code>
                <xsl:value-of select="text()" />
            </code>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/episodedetails/status">
        <xsl:if test="text() and not(text()='')">
            <status>
                <xsl:value-of select="text()" />
            </status>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/premiered | /tvshow/premiered">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()">
                <xsl:sort select="@Name"/>
            </xsl:apply-templates>
        </xsl:copy>
        <xsl:if test="not(../year) or not(../year[text()]) or ../year[text()='']">
            <year>
                <xsl:value-of select="substring-before(text(), '-')" />
            </year>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/dateadded | /tvshow/dateadded | /episodedetails/dateadded">
        <dateadded>
            <xsl:choose>
                <xsl:when test="text() and not(text()='')">
                    <xsl:value-of select="text()" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$created-datetime" />
                </xsl:otherwise>
            </xsl:choose>
        </dateadded>
    </xsl:template>

    <!-- votes tmbid
        role surrounded by quotes inside

        actor
        fileinfo
        uniqueid
    -->
    <xsl:template match="/movie/rating[not(text()='')] | /tvshow/rating[not(text()='')] | /episodedetails/rating[not(text()='')]">
        <xsl:if test="text() and not(text()='')">
            <xsl:copy>
                <xsl:apply-templates select="@*|node()">
                    <xsl:sort select="@Name"/>
                </xsl:apply-templates>
            </xsl:copy>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/ratings | /tvshow/ratings | /episodedetails/ratings">
        <xsl:if test="not(../rating) or not(../rating[text()]) or ../rating[text()='']">
            <rating>
                <xsl:value-of select="../ratings/rating[@default='true']/value[text()]" />
            </rating>
        </xsl:if>
        <xsl:if test="not(../votes) or not(../votes[text()]) or ../votes[text()='']">
            <votes>
                <xsl:value-of select="../ratings/rating[@default='true']/votes[text()]" />
            </votes>
        </xsl:if>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()">
                <xsl:sort select="@Name"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/movie/epbookmark | /tvshow/epbookmark | /episodedetails/epbookmark">
        <xsl:if test="text() and not(text()='') and not(text()='0') and not(text()='0.000000')">
            <epbookmark>
                <xsl:value-of select="text()" />
            </epbookmark>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/year | /tvshow/year | /episodedetails/year">
        <xsl:if test="text() and not(text()='') and not(text()='0')">
            <year>
                <xsl:value-of select="text()" />
            </year>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/votes | /tvshow/votes | /episodedetails/votes">
        <xsl:if test="text() and not(text()='') and not(text()='0')">
            <votes>
                <xsl:value-of select="text()" />
            </votes>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/userrating | /tvshow/userrating | /episodedetails/userrating">
        <xsl:if test="text() and not(text()='') and not(text()='0')">
            <userrating>
                <xsl:value-of select="text()" />
            </userrating>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/top250 | /episodedetails/top250">
        <xsl:if test="text() and not(text()='') and not(text()='0')">
            <top250>
                <xsl:value-of select="text()" />
            </top250>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/tagline | /episodedetails/tagline">
        <xsl:if test="text() and not(text()='')">
            <tagline>
                <xsl:value-of select="text()" />
            </tagline>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/outline | /episodedetails/outline">
        <xsl:if test="text() and not(text()='')">
            <outline>
                <xsl:value-of select="text()" />
            </outline>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/plot | /episodedetails/plot">
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
                <xsl:value-of select="text()" />
            </plot>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/director | /episodedetails/director">
        <xsl:if test="text() and not(text()='')">
            <director>
                <xsl:value-of select="text()" />
            </director>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/credits | /episodedetails/credits">
        <xsl:if test="text() and not(text()='')">
            <credits>
                <xsl:value-of select="text()" />
            </credits>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/runtime | /tvshow/runtime | /episodedetails/runtime">
        <xsl:if test="text() and not(text()='') and not(text()='0')">
            <runtime>
                <xsl:value-of select="text()" />
            </runtime>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/playcount | /tvshow/playcount | /episodedetails/playcount">
        <xsl:choose>
            <xsl:when test="text() and not(text()='')">
                <playcount>
                    <xsl:value-of select="text()" />
                </playcount>
            </xsl:when>
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
            <xsl:value-of select="text()" />
        </tag>
    </xsl:template>

    <xsl:template match="/movie/lastplayed">
        <lastplayed>
            <xsl:value-of select="text()" />
        </lastplayed>
    </xsl:template>
    <xsl:template match="/tvshow/lastplayed | /episodedetails/lastplayed">
        <lastplayed>
            <xsl:if test="text() and not(text()='')">
                <xsl:choose>
                    <xsl:when test="$latest-lastplayed=''">
                        <xsl:value-of select="text()" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$latest-lastplayed" />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </lastplayed>
    </xsl:template>

    <xsl:template match="/tvshow/episodeguide" />
    <xsl:template match="/tvshow/id | /episodedetails/id" />
    <xsl:template match="/movie/id">
        <xsl:if test="text() and not(text()='')">
            <id>
                <xsl:value-of select="text()" />
            </id>
            <xsl:if test="not(../uniqueid)">
                <xsl:if test="starts-with(text(), 'tt')">
                    <uniqueid default="true" type="imdb">
                        <xsl:value-of select="text()" />
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

    <xsl:template match="/movie/trailer | /tvshow/trailer | /episodedetails/trailer">
        <xsl:if test="text() and not(text()='')">
            <trailer>
                <!-- TODO: Standardize Youtube links -->
                <xsl:value-of select="text()" />
            </trailer>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/movie/originaltitle[text()=../title[text()] or not(text()) or text()=''] | /tvshow/originaltitle[text()=../title[text()] or not(text()) or text()='']" />
    <xsl:template match="/movie/sorttitle[text()=../title[text()] or not(text()) or text()=''] | /tvshow/sorttitle[text()=../title[text()] or not(text()) or text()='']" />
    <xsl:template match="/movie/showtitle[text()=../title[text()] or not(text()) or text()=''] | /tvshow/showtitle[text()=../title[text()] or not(text()) or text()='']" />
    <xsl:template match="/movie/fanart[not(text())]" />
    <xsl:template match="/tvshow/fanart | /episodedetails/fanart" />
    <xsl:template match="/movie/generator | /tvshow/generator | /episodedetails/generator" />

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

    <xsl:template match="/tvshow | /episodedetails" priority="-1">
     <xsl:copy>
          <xsl:variable name="vSortingValues" select="',,title,originaltitle,sorttitle,userrating,rating,ratings,outline,plot,tagline,runtime,mpaa,playcount,lastplayed,id,uniqueid,top250,genre,country,set,credits,director,premiered,year,studio,showlink,trailer,fileinfo,studio,actor,dateadded,tag,generator,'" />
      <xsl:apply-templates select="@*|node()">
        <!--
          <xsl:sort select="string-length(mf:substring-before-if-contains($vSortingValues,concat(',', name(),',')))" order="ascending" data-type="number"/>
        -->
      </xsl:apply-templates>
            <!-- MISC -->
            <!--
            <xsl:if test="not(./mpaa)">
                <mpaa></mpaa>
            </xsl:if>
            -->
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
                    <xsl:if test="$latest-lastplayed and not($latest-lastplayed='')">
                        <xsl:value-of select="$latest-lastplayed" />
                    </xsl:if>
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
                <kodiversion>13</kodiversion>
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
                <kodiversion>13</kodiversion>
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
