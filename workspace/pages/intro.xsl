<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/quotations.xsl"/>
<xsl:import href="../utilities/articles.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />


<xsl:template match="/data">
	<h1>Nichols Communications</h1>
	<xsl:apply-templates select="random-quotations/entry" />
	<a id="enter" href="{$root}/home">enter the site</a>
</xsl:template>
</xsl:stylesheet>