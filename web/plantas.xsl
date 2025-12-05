<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-compat" />
  
  <!-- Plantilla raíz -->
  <xsl:template match="/">
    <xsl:apply-templates select="jardinBotanico/plantas"/>
  </xsl:template>
  
  <!-- Plantilla principal: intercalamos código HTML con datos XML -->
  <xsl:template match="jardinBotanico/plantas">
    <html lang="es">
      
      <head>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
        <meta charset="utf-8"/>
        <meta name="description" content="Página principal" />
        <title>Plantas</title>
      </head>
      
      <body>
        <header>
          <img src= "../img/logotipo.png" alt= "Reservas" />
          <a href="zonas.xml">Zonas</a>
          <a href="plantas.xml">Plantas</a>
          <a href="actividades.xml">Actividades</a>
        </header>
        
        <main id="jardinbotanico">
          <h1>PLANTAS</h1>
          <!-- Genera cada planta como artículo -->
          <xsl:apply-templates select="planta"/>
        </main>
            
        <footer>
          <address>&#169; Desarrollado por info@birt.eus</address>
        </footer>
      </body>
    </html>
  </xsl:template>  
  
  <!-- Plantilla para planta -->
  <xsl:template match="planta">
    <article class="articulo">
      <img class="imagen" src="../img/{@foto}" alt="{nombreComun}"/>
      
      <!-- Icono de alta luminosidad si es el caso -->
      <xsl:if test="luminosidad='Alta'">
        <img src="../img/Alta.png" class="alta-icono" alt="Alta luminosidad"/>
      </xsl:if>

      <h2><a href="{concat('https://es.wikipedia.org/wiki/', @familia)}" target="_blank"><xsl:value-of select="nombreComun"/></a></h2>	
    
      <h3><xsl:value-of select="luminosidad"/></h3>
    </article>
  </xsl:template>

</xsl:stylesheet>