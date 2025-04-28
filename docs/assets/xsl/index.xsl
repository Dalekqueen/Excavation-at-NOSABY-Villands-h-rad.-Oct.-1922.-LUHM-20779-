<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:html="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs tei html" version="2.0">
    <xsl:output method="html"/>

    <!-- transform the root element (TEI) into an HTML template -->
    <xsl:template match="tei:TEI">
        
        <html lang="en" xml:lang="en">
            <head>
                <title>
                    <!-- add the title from the metadata. This is what will be shown
                    on your browsers tab-->
                    DCHM Template: Hem
                </title>
                <!-- load bootstrap css (requires internet!) so you can use their pre-defined css classes to style your html -->
                <link rel="stylesheet"
                    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                    crossorigin="anonymous"/>
                <!-- load the stylesheets in the assets/css folder, where you can modify the styling of your website -->
                <link rel="stylesheet" href="assets/css/main.css"/>
                <link rel="stylesheet" href="assets/css/desktop.css"/>
            </head>
            <body>
                <header>
                    <h1>
                        <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                    </h1>
                </header>
                <nav id="sitenav">
                    <a href="index.html">Hem</a> |
                    <a href="bakgrund.html">Bakgrund</a> |
                    <a href="transkribering.html">Transkribering</a> |
                    <a href="bilagor.html">Bilagor</a> |
                </nav>
                <main id="manuscript">
                    <!-- bootstrap "container" class makes the columns look pretty -->
                    <div class="container">
                        <div class="row">
                            
                            <!-- First column with pictures-->
                            <div class="col-sm">
                                <article id="collection">
                                    <xsl:for-each select="//tei:surface[position() mod 2 = 1 and tei:figure/tei:graphic[2]/@url != 'https://digitaltmuseum.se/0210110451336/sjofartsutstallning-pa-gavle-museum-1957-museichef-olle-kallstrom/media?slide=0']">
                                        <img class="thumbnail">
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="tei:figure/tei:graphic[2]/@url"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="title">
                                                <xsl:value-of select="tei:figure/tei:label"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="alt">
                                                <xsl:value-of select="tei:figure/tei:figDesc"/>
                                            </xsl:attribute>
                                        </img>                              
                                    </xsl:for-each>
                                </article>
                            </div>
                            
                            <!-- Second column with pictures-->
                            <div class="col-sm">
                                <article id="collection">
                                    <xsl:for-each select="//tei:surface[position() mod 2 = 0]">
                                        <img class="thumbnail">
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="tei:figure/tei:graphic[2]/@url"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="title">
                                                <xsl:value-of select="tei:figure/tei:label"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="alt">
                                                <xsl:value-of select="tei:figure/tei:figDesc"/>
                                            </xsl:attribute>
                                        </img>                              
                                    </xsl:for-each>
                                </article>
                            </div>
                        </div>
                        
                        <!-- third column with description and details-->
                        <div class="row">
                            <div class="col-sm">
                                <article id="beskrivning">
                                    <p>
                                        <strong>Beskrivning:</strong> &#160;
                                        <xsl:apply-templates select="//tei:mscontents"/>
                                        <xsl:value-of select="//tei:summary"/>
                                    </p>
                                </article>
                            </div>
                        </div>
                       
                        <div class="row">
                            <div class="col-sm">
                                <article id="details">
                                    <p>
                                        <strong>Författare:</strong><br/>
                                        <xsl:apply-templates select="//tei:titleStmt/tei:author"/>
                                    </p>
                                    <p>
                                        <strong>Transkribering av:</strong><br/>
                                        <xsl:apply-templates select="//tei:titleStmt/tei:principal"/>
                                    </p>
                                    <p>  
                                        <strong>Institution:</strong><br/>
                                        <xsl:apply-templates select="//tei:publicationStmt/tei:authority"/>
                                    </p>
                                    <p>  
                                        <strong>Universitet:</strong><br/>
                                        <xsl:apply-templates select="//tei:publicationStmt/tei:publisher"/>
                                    </p>
                                    <p>
                                        <strong>Datum:</strong><br/>
                                        <xsl:apply-templates select="//tei:publicationStmt/tei:date"/>
                                    </p>
                                </article>
                            </div>
                        </div>
                    </div>
                </main>
                
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
