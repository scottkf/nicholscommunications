<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/page-title.xsl"/>
<xsl:import href="../utilities/navigation.xsl"/>
<xsl:import href="../utilities/articles.xsl"/>
<xsl:import href="../utilities/date-time.xsl"/>


<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="no"
	encoding="UTF-8"
	indent="yes" />
	
<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in"/>

<xsl:template match="/">

<html>
<head>
	<title>
		<xsl:call-template name="page-title"/>
	</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
  	<meta name="description" content="Keep Flippin' is performance-based gymnastics. We are also franchising!" />
  	<meta name="keywords" content="gymnastic franchising, franchising, performance gymnastics, performance franchising, gymnastic franchise, franchise, keep flipping, keep flipping gymnastics" />
  	<meta name="copyright" content="Keep Flippin'" />
  	<meta name="company" content="Keep Flippin'" />
  	<xsl:comment>
   
    	Looking is learning, taking is learning, taking credit is :(
   
  	</xsl:comment>
	<link rel="stylesheet" href="{$workspace}/stylesheets/screen.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="{$workspace}/stylesheets/print.css" type="text/css" media="print" />
	<!--[if IE]><link rel="stylesheet" href="{$workspace}/stylesheets/ie.css" type="text/css" media="screen, projection"><![endif]-->
	<link rel="alternate" type="application/rss+xml" href="{$root}/rss/" />

	<script src="{$workspace}/javascripts/analytics.js" type="text/javascript"></script>
	<script src="{$workspace}/javascripts/modernizr-1.5.min.js" type="text/javascript"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>
	<script src="{$workspace}/javascripts/application.js" type="text/javascript"></script>
	
</head>
<body id="{$root-page}" class="bp">
	<div id="container">
	<xsl:if test="$root-page != 'intro'">
		<header id="top">
			<div id="logo">
				<a href="{$root}"><img src="{$workspace}/images/logo.jpg" alt="Nichols Communications" title="Nichols Communications Logo" /><!-- <xsl:value-of select="$website-name"/> --></a>
			</div>
			<nav>
				<xsl:apply-templates select="data/system-navigation"/>
			</nav>

		</header>
	</xsl:if>
	<section id="content">
		<xsl:if test="$current-page != 'news' and count(/data/random-image/entry) > 0">
			<img class="float" src="{$workspace}{/data/random-image/entry/name/@path}/{/data/random-image/entry/name/filename}" title="{/data/random-image/entry/name/filename}" alt="{/data/random-image/entry/name/filename}"/>
		</xsl:if>
		<xsl:apply-templates />
	</section>
	
	<xsl:if test="$root-page != 'intro'">
		<footer id="bottom">
			<articles>
				<h3>News</h3>
				<xsl:apply-templates select="data/latest-articles/entry" mode="short"/>
			</articles>
			<aside>
				<h3>We are here</h3>
				<p>
				<span class="street">263 Sherburne Place</span><br />
				<span class="city">Lyndonville</span>, <span class="state">Vermont</span><xsl:text> </xsl:text>
				<span class="zip">05851</span></p>
				<p>
				<span class="phone">(802) 626-4142</span><br />
				<span class="fax">(802) 626-4142 (fax)</span></p>
				<p><a href="mailto:info@nicholscommunications.com">info@nicholscommunications.com</a></p>
			</aside>
			<aside>
				<h3>Contact us</h3>
				<img src="{$workspace}/images/qr.jpg" alt="QR code" title="QR Code for Nichols Communications" />
			</aside>
		</footer>
		<div class="copyright">&#169;2010 Nichols Communications</div>
	</xsl:if>
	</div>

</body>
</html>

</xsl:template>

</xsl:stylesheet>