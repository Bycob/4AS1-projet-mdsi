<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:maq="maquettes"
  xmlns:types="types"
  xmlns:ufs="ufs"
  xmlns:pers="pers">

  <xsl:template match="/">
    <html>
      <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
      <head>
        <title>Maquette</title>
        <link rel="stylesheet" href="styles.css"/>
      </head>
      <body>
        <xsl:apply-templates select="/maq:maquette/maq:semestre" />
      </body>
    </html>
  </xsl:template>
  <xsl:variable name="semester" select="/maq:maquette/maq:semestre/@nom"/>
  <h1>Semestre <xsl:value-of select="$semester"/></h1>
  <xsl:template match="maq:semestre">
    <xsl:apply-templates select="types:uf"/>
  </xsl:template>

  <xsl:template match="types:uf">
    <xsl:variable name="ufid" select="."/>
    <xsl:apply-templates select="/maq:maquette/ufs:ufs/ufs:uf[@code=$ufid]" />
  </xsl:template>

  <xsl:template match="ufs:uf">
    <h2>
      

    </h2>
    <table>
        <tr>
            <th>Grands Domaines</th>
            <th>Cours (O : Obligatoire, C : Choix)</th>
            <th>Semestre</th>
            <th>Intitulé de la formation</th>
            <th>Code APOGEE</th>
            <th>Mail du responsable</th>
            <th>Hétérogène</th>
            <th>Continuité</th>
            <th>Evaluation par compétences</th>
            <th>Total présentiel</th>
            <th>Épreuve</th>
            <th>Coef</th>
            <th>ECTS</th>
        </tr>
        <tr>
            <td><xsl:value-of select="@grand_domaine" /></td>
            <td><xsl:variable name="type_c" select="@obligatoire"/>
                <xsl:choose>
                    <xsl:when test="$type_c = 'true'">O</xsl:when>
                    <xsl:otherwise>C</xsl:otherwise>
                </xsl:choose>
            </td>
            <td><xsl:value-of select="$semester" /></td>
            <td>
                <table>
                    <th>
                        <tr><xsl:value-of select="@intitule" /></tr>
                    </th>
                        <xsl:for-each select="./types:sous_uf">
                            <tr>
                                <td><xsl:value-of select="@intitule"/></td>
                            </tr>
                        </xsl:for-each>
                </table>
            </td>
            <td><xsl:value-of select="@code" /></td>
            <td><xsl:variable name="id_resp" select="@responsable"/>
                  <table>
                    <th>
                        <tr><xsl:apply-templates select="/maq:maquette/ufs:ufs/pers:personnes/pers:responsable[@id=$id_resp]"/></tr>
                    </th>
                        <xsl:for-each select="./types:sous_uf">
                            <xsl:variable name="id_resp_suf" select="@responsable"/>
                            <tr>
                                <td><xsl:apply-templates select="/maq:maquette/ufs:ufs/pers:personnes/pers:responsable[@id=$id_resp_suf]"/></td>
                            </tr>
                        </xsl:for-each>
                </table>
            </td>
            <td><xsl:variable name="hetero" select="@heterogene"/>
                <xsl:choose>
                    <xsl:when test="$hetero = 'true'">OUI</xsl:when>
                    <xsl:otherwise>NON</xsl:otherwise>
                </xsl:choose>
            </td>
            <td><xsl:variable name="continuite" select="@continuite"/>
                <xsl:choose>
                    <xsl:when test="$continuite = 'true'">OUI</xsl:when>
                    <xsl:otherwise>NON</xsl:otherwise>
                </xsl:choose>
            </td>
            <td><xsl:variable name="eval_par_competences" select="@eval_par_competences"/>
                <xsl:choose>
                    <xsl:when test="$eval_par_competences = 'true'">OUI</xsl:when>
                    <xsl:otherwise>NON</xsl:otherwise>
                </xsl:choose></td>
            <td>
                 <table>
                    <th>
                        <tr><xsl:value-of select="@total_presentiel" /></tr>
                    </th>
                        <xsl:for-each select="./types:sous_uf">
                            <tr>
                                <td><xsl:value-of select="@total_presentiel"/></td>
                            </tr>
                        </xsl:for-each>
                </table>
            </td>
            <td><table>
                    <th>
                        <tr><xsl:value-of select="@coef"/></tr>
                    </th>
                        <xsl:for-each select="./types:epreuve">
                            <tr>
                                <td><xsl:value-of select="@coef"/></td>
                            </tr>
                        </xsl:for-each>
                </table>
            </td>
            <td>
                <table>
                    <th>
                        <tr><br/></tr>
                    </th>
                        <xsl:for-each select="./types:epreuve">
                            <tr>
                                <td><xsl:value-of select="@intitule"/></td>
                            </tr>
                        </xsl:for-each>
                </table>
            </td>
            <td><xsl:value-of select="@ECTS"/></td>
        </tr>
    </table>
  </xsl:template>
  <xsl:template match="pers:responsable">
    <xsl:value-of select="@email"/>
  </xsl:template>

</xsl:stylesheet>
