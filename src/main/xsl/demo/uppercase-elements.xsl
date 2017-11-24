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
      <xd:p>A simple demo XSL that uppercases all elements names</xd:p>
    </xd:desc>
  </xd:doc>
  

  <xd:doc>
    <xd:desc>
      <xd:p>Copies attributes</xd:p>
    </xd:desc>
  </xd:doc>
  <xsl:template match="@*">
    <xsl:copy-of select="."/>
  </xsl:template>
  
  <xd:doc>
    <xd:desc>
      <xd:p>Copies element, changing its name by its upper-cased name</xd:p>
    </xd:desc>
  </xd:doc>
  <xsl:template match="*">
    <xsl:element name="{upper-case(local-name())}" namespace="{namespace-uri(.)}">
      <xsl:apply-templates select="node()|@*"/>
    </xsl:element>
  </xsl:template>
  
</xsl:stylesheet>