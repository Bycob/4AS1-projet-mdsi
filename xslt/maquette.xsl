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
        <style>
            @import url('https://fonts.googleapis.com/css?family=Amarante');

          html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline;
            outline: none;
            -webkit-font-smoothing: antialiased;
            -webkit-text-size-adjust: 100%;
            -ms-text-size-adjust: 100%;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
          }
          html { overflow-y: scroll; }
          body {
            background: #eee url('https://i.imgur.com/eeQeRmk.png'); /* https://subtlepatterns.com/weave/ */
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            font-size: 62.5%;
            line-height: 1;
            color: #585858;
            padding: 22px 10px;
            padding-bottom: 55px;
          }

          ::selection { background: #5f74a0; color: #fff; }
          ::-moz-selection { background: #5f74a0; color: #fff; }
          ::-webkit-selection { background: #5f74a0; color: #fff; }

          br { display: block; line-height: 1.6em; }

          article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { display: block; }
          ol, ul { list-style: none; }

          input, textarea {
            -webkit-font-smoothing: antialiased;
            -webkit-text-size-adjust: 100%;
            -ms-text-size-adjust: 100%;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            outline: none;
          }

          blockquote, q { quotes: none; }
          blockquote:before, blockquote:after, q:before, q:after { content: ''; content: none; }
          strong, b { font-weight: bold; }

          table { border-collapse: collapse; border-spacing: 0; }
          img { border: 0; max-width: 100%; }

          h1 {
            font-family: 'Amarante', Tahoma, sans-serif;
            font-weight: bold;
            font-size: 3.6em;
            line-height: 1.7em;
            margin-bottom: 10px;
            text-align: center;
          }


          /** page structure **/
          #wrapper {
            display: block;
            width: 100%;
            background: #fff;
            margin: 0 auto;
            padding: 10px 17px;
            -webkit-box-shadow: 2px 2px 3px -1px rgba(0,0,0,0.35);
          }

          #keywords {
            margin: 0 auto;
            font-size: 1.2em;
            margin-bottom: 15px;
          }


          #keywords thead {
            cursor: pointer;
            background: #c9dff0;
          }
          #keywords thead tr th {
            font-weight: bold;
            padding: 12px 30px;
            padding-left: 42px;
          }
          #keywords thead tr th span {
            padding-right: 20px;
            background-repeat: no-repeat;
            background-position: 100% 100%;
          }

          #keywords thead tr th.headerSortUp, #keywords thead tr th.headerSortDown {
            background: #acc8dd;
          }

          #keywords thead tr th.headerSortUp span {
            background-image: url('https://i.imgur.com/SP99ZPJ.png');
          }
          #keywords thead tr th.headerSortDown span {
            background-image: url('https://i.imgur.com/RkA9MBo.png');
          }
          #keywords tbody tr {
            color: #555;
          }
          #keywords tbody tr td {
            text-align: center;
            padding: 15px 10px;
          }
          #keywords tbody tr td.lalign {
            text-align: left;
          }
          .header img {
              float: left;
              width: 100px;
              height: 100px;
              background: #555;
          }
          .header h1 {
              position: relative;
              top: 18px;
              left: 10px;
          }

        </style>
      </head>
      <body>
      <div id="wrapper">
        <h1>
          DEPARTEMENT Sciences et Technologies Pour l'Ingénieur
        </h1>
        <div class="header">
          <img src="img/logo.png" alt="logo" />
            <h1>My website name</h1>
        </div>
        <xsl:apply-templates select="/maq:maquette/maq:semestre" />
      </div>
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
    <table  id="keywords" cellspacing="0" cellpadding="0">
      <thead>
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
      </thead>
      <tbody>
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
                </xsl:choose>
            </td>
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
            <td>
               <table>
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
      </tbody>
    </table>
  </xsl:template>
  <xsl:template match="pers:responsable">
    <xsl:value-of select="@email"/>
  </xsl:template>

</xsl:stylesheet>
