<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-compat" />
    
    <!-- Plantilla raíz -->
    <xsl:template match="/">
        <xsl:apply-templates select="jardinBotanico/actividades"/>
    </xsl:template>
    
    <!-- Plantilla principal: intercalamos código HTML con datos XML -->
    <xsl:template match="jardinBotanico/actividades" >
        <xsl:variable name="mes" select="11"/>
        <html lang="es">
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8"/>
                <meta name="description" content="Página principal" />
                <title>Actividades</title>
            </head>
            
            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Reservas" />
                    <a href="zonas.xml">Zonas</a>
                    <a href="plantas.xml">Plantas</a>
                    <a href="actividades.xml">Actividades</a>
                </header>
                
                <main>
                    <h1>Actividades del mes <xsl:value-of select="$mes"/></h1>
                    <!-- Reproduce las actividades del mes 11 ordenadas por fecha y hora -->
                    <xsl:apply-templates select="actividad[substring(fechaHora,6,2)=$mes]">
                        <xsl:sort select="fechaHora"/>
                    </xsl:apply-templates>
                </main>
                
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template> 
    
    <!-- Plantilla para actividad -->
    <xsl:template match="actividad">
        <div class="actividades">
            <h4>
                <xsl:value-of select="titulo"/> 
                - 
                <xsl:value-of select="count(responsables/responsable)"/> 
                <xsl:choose>
                    <xsl:when test="count(responsables/responsable) = 1">
                        Responsable
                    </xsl:when>
                    <xsl:otherwise>
                        Responsables
                    </xsl:otherwise>
                </xsl:choose>
            </h4>
            <h2>Fecha: <xsl:value-of select="substring(fechaHora,1,10)"/></h2>
            <h2>Hora: <xsl:value-of select="substring(fechaHora,12,5)"/></h2>
            <h2>Lugar: <xsl:value-of select="@sala"/></h2>
            <ul>
                <!-- Muestra responsable(s) de la actividad -->
                <xsl:apply-templates select="responsables/responsable"/>
            </ul>
        </div>
    </xsl:template>
    
    <!-- Plantilla para responsable -->
    <xsl:template match="responsable">
        <!-- Muestra como elemento de una lista el nombre y el email del responsable -->
        <li>
            <xsl:value-of select="nomresponsable"/> - <xsl:value-of select="email"/>
        </li>
    </xsl:template>

</xsl:stylesheet>