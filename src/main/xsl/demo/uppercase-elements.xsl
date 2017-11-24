<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  exclude-result-prefixes="xs math xd"
  version="3.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Nov 23, 2017</xd:p>
      <xd:p><xd:b>Author:</xd:b> cmarchand</xd:p>
      <xd:p></xd:p>
    </xd:desc>
  </xd:doc>
  

  <xsl:template match="@*">
    <xsl:copy-of select="."/>
  </xsl:template>
  
  <xd:doc>
    <xd:desc/>
  </xd:doc>
  <xsl:template match="*">
    <xsl:variable name="prefix" as="xs:string" select="if(contains(name(.),':')) then concat(substring-before(name(.),':'),':') else ''"/>
    <xsl:message>prefix is <xsl:value-of select="$prefix"/>.</xsl:message>
    <xsl:variable name="elementName" as="xs:string" select="concat($prefix,upper-case(local-name(.)))"/>
    <xsl:message>elementName is <xsl:value-of select="$elementName"/>.</xsl:message>
    <xsl:element name="{$elementName}">
      <xsl:apply-templates select="node()|@*"/>
    </xsl:element>
  </xsl:template>
  
  <!--xsl:template match="node() | @*">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*"/>
    </xsl:copy>
  </xsl:template-->
  
</xsl:stylesheet>