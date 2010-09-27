<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="article-url">
	<xsl:param name="entry" select="entry"/>
	<a>
		<xsl:attribute name="href">
			<xsl:value-of select="$root"/>
			<xsl:value-of select="'/news/'"/>
			<xsl:value-of select="substring(published-on, 1, 4)"/>
			<xsl:value-of select="'/'"/>
			<xsl:value-of select="title/@handle"/>
			<xsl:value-of select="'/'"/>
		</xsl:attribute>
		<xsl:value-of select="title"/>
	</a>			
</xsl:template>


<xsl:template match="title">

</xsl:template>

<xsl:template match="latest-articles/entry | news/entry">
	<xsl:if test="published = 'Yes'">
		<article>
			<header>
				<h2>
					<xsl:choose>
						<xsl:when test="count(/data/news/entry) = 1">
							<xsl:value-of select="title"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="article-url">
								<xsl:with-param name="entry" select="."/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</h2>
				<div class="date">posted <em><xsl:value-of select="published-on"/></em><xsl:text> </xsl:text>
				<span>by</span> <em><xsl:value-of select="author"/></em></div>
			</header>
			<section>
				<xsl:copy-of select="body/*[1]"/>
				<xsl:copy-of select="body/*[position() &gt; 1]"/>
			</section>
		</article>
	</xsl:if>
</xsl:template>

<xsl:template match="latest-articles/entry" mode="short">
	<xsl:if test="published = 'Yes'">
		<article>
			<header>
				<h4><xsl:call-template name="article-url">
					<xsl:with-param name="entry" select="."/>
				</xsl:call-template></h4>
			</header>
		</article>
	</xsl:if>
</xsl:template>
	
</xsl:stylesheet>