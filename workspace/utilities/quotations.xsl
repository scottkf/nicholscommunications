<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="random-quotations/entry">
	<div id="quotation"><xsl:value-of select="quotation"/><!-- <xsl:value-of select="author"--></div>
</xsl:template>

</xsl:stylesheet>