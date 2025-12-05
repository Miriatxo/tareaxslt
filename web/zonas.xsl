<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-compat" />
  
  <!-- Plantilla raíz -->
  <xsl:template match="/">
    <xsl:apply-templates select="jardinBotanico/zonas"/>
  </xsl:template>
  
  <!-- Plantilla principal: intercalamos código HTML con datos XML -->
  <xsl:template match="jardinBotanico/zonas" >
    <html lang="es">
      
      <head>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <meta charset="utf-8"/>
        <meta name="description" content="Página de zonas" />
        <title>Zonas del Jardín</title>
      </head>
      
      <body>
        <header>
          <img src= "../img/logotipo.png" alt= "Reservas" />
          <a href="zonas.xml">Zonas</a>
          <a href="plantas.xml">Plantas</a>
          <a href="actividades.xml">Actividades</a>
        </header>
        
        <main>
          <h1>ZONAS</h1>
          <table>
            <tr>
              <th>ZONA</th>
              <th>Ubicación</th>
              <th>Horario</th>
            </tr>
            <!-- Genera cada zona que no abre más tarde de las 10 como fila de la tabla -->
            <xsl:apply-templates select="zona[number(substring-before(horarioapertura, ':')) &lt;= 10]"/>

          </table>			
        </main>
    
        <footer>
          <address>&#169; Desarrollado por info@birt.eus</address>
        </footer>
      </body>
    </html>
  </xsl:template>
  
  <!-- Plantilla para zona -->
  <xsl:template match="zona">
    <tr>
      <td><xsl:value-of select="nombre"/></td>

      <!-- Columna condicional: azul si su ubicación contiene la palabra "Exterior" -->
      <xsl:choose >
        <xsl:when test="contains(ubicacion, 'Exterior')">
          <td class="azul"><xsl:value-of select="ubicacion"/></td>
        </xsl:when>
        <xsl:otherwise>
          <td><xsl:value-of select="ubicacion"/></td>
        </xsl:otherwise>
      </xsl:choose>
      
      <td><xsl:value-of select="horarioapertura"/> - <xsl:value-of select="horariocierre"/></td>
    </tr>
  </xsl:template>
</xsl:stylesheet>