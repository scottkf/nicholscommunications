<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="data">
	<div id="left">
	<h5 class="phone">Call us</h5>
	<p>
		+1 (802) 626-4148
	</p>
	<h5 class="email">Contact us via email</h5>
	<p>
	  Fill out the form on the right, and we'll get back to you straight away.<br /><br />
		Mail us directly at <a href="mailto:info@nicholscommunications.com">info@nicholscommunications.com</a>.
	</p>
	</div>
	<div id="right">
  <form action="" method="post">
    <xsl:for-each select="events/save-message">
      <label class="{@result}">
        <xsl:choose>
          <xsl:when test="@result = 'success'">Email sent.</xsl:when>
          <xsl:when test="name/@type = 'missing'">You didn't enter your name!</xsl:when>
          <xsl:when test="email/@type = 'missing'">You didn't enter your email address!</xsl:when>
          <xsl:when test="message/@type = 'missing'">You didn't enter a message!</xsl:when>
          <xsl:when test="email/@type = 'invalid'">You entered an invalid email address.</xsl:when>
          <xsl:otherwise>There was a problem below, please make sure all the fields are filled out.</xsl:otherwise>
        </xsl:choose>
      </label>
    </xsl:for-each>
    <fieldset>
      <div>
      	<h3>We would love to hear from you!</h3>
      	<!-- <h5>All fields are required.</h5> -->
        <label class="required">Your name<input type="text" name="fields[name]" value="{events/save-message/post-values/name}" /></label>
        <label class="required">Email Address<input type="text" name="fields[email]" value="{events/save-message/post-values/email}" /></label>
        <label class="required">This is regarding
          <xsl:choose>
            <xsl:when test="events/save-message/post-values/subject">
              <input type="text" name="fields[subject]" value="{events/save-message/post-values/subject}" />
            </xsl:when>
            <xsl:otherwise>
              <input type="text" name="fields[subject]" value="A general question" />
            </xsl:otherwise>
          </xsl:choose>
        </label>
        <label>Message<textarea name="fields[message]" rows="5" cols="21"><xsl:value-of select="events/save-message/post-values/message" /></textarea></label>
        <input name="send-email[sender-email]" value="fields[email]" type="hidden" />
        <input name="send-email[sender-name]" value="fields[name]" type="hidden" />
        <input name="send-email[subject]" value="fields[subject]" type="hidden" />
        <input name="send-email[body]" value="fields[message],fields[subject],fields[email],fields[name]" type="hidden" />
  			<input name="fields[date-contacted]" value="{$today}" type="hidden" />
        <input name="send-email[recipient]" value="scott,steve" type="hidden" />
        <input class="send-message" id="submit" type="submit" name="action[save-message]" value="Send us a message!" />
      </div>

    </fieldset>
  </form>
</div>
</xsl:template>

</xsl:stylesheet>
