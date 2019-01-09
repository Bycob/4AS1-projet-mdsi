<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:maq="maquettes"
  xmlns:types="types"
  xmlns:ufs="ufs">

  <xsl:template match="/">
    <html>
      <head>

      </head>
      <body>
        <xsl:apply-templates select="/maq:maquette/maq:semestre" />
      </body>
    </html>
  </xsl:template>

  <xsl:template match="maq:semestre">
    <h1>Semestre</h1>
    <xsl:apply-templates select="types:uf"/>
  </xsl:template>

  <xsl:template match="types:uf">
    <xsl:variable name="ufid" select="."/>
    <xsl:apply-templates select="/maq:maquette/ufs:ufs/ufs:uf[@code=$ufid]" />
  </xsl:template>

  <xsl:template match="ufs:uf">
    <h2>
      <xsl:value-of select="@code" />
      <xsl:text> </xsl:text>
      <xsl:value-of select="@intitule" />
    </h2>
  </xsl:template>

</xsl:stylesheet>
