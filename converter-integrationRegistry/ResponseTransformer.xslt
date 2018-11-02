<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns2="http://spring.io/guides/gs-producing-web-service" xmlns:ns3="http://www.reachit.co">
<xsl:template match="/">
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns2="http://spring.io/guides/gs-producing-web-service">
  <SOAP-ENV:Header>
    <ns3:Desciption>
	  <xsl:text>
	    Operation returns </xsl:text>
	  <xsl:choose>
        <xsl:when test="name(/SOAP-ENV:Envelope/SOAP-ENV:Body/*[1]) = 'ns2:distanceInKmResponse'">distance in kilometers
        </xsl:when>
		        <xsl:when test="name(/SOAP-ENV:Envelope/SOAP-ENV:Body/*[1]) = 'ns2:distanceInMilesResponse'">distance in miles
        </xsl:when>
        <xsl:otherwise>
             distance in miles
        </xsl:otherwise>
      </xsl:choose>
	  </ns3:Desciption>
  </SOAP-ENV:Header>
<td><xsl:copy-of select="SOAP-ENV:Envelope/SOAP-ENV:Body"/></td>
</SOAP-ENV:Envelope>
</xsl:template>
</xsl:stylesheet>