<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output name= "my-output" method="html" encoding ="UTF-8" indent="yes"/>
    <xsl:template match="/App">
        <xsl:result-document href="index.html" format="my-output">
                <html>
                    <head>
                        <link rel="stylesheet" href="indexStyle.css"></link>
                    </head>
                    <body>
                        <h1> Bienvenue sur O'délices, par Nima et Yanis </h1>
                        <div id="menu">
                            <ul>
                                <li><a href="index.html">Home</a></li>
                                <li><a href="auteurs.html">Auteurs</a></li>
                                <li><a href="categories.html">Categories</a></li>
                                <li><a href="produits.html">Produits</a></li>
                                <li><a href="ingredients.html">Ingrédients</a></li>
                                <li><a href="recettes.html">Recettes</a></li>
                            </ul>
                        </div>
                        <img src="https://www.kness.fr/wp-content/uploads/2019/12/illustration-cuisine-recette-tarte-myrtille-1024x527.jpg"> </img>
                    </body>
                </html>
        </xsl:result-document>
        <xsl:result-document href="auteurs.html" format="my-output">
        <html>
            <head>
                <link rel="stylesheet" href="indexStyle.css"></link>
            </head>
            <body>
                <div id="menu">
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li><a href="auteurs.html">Auteurs</a></li>
                        <li><a href="categories.html">Categories</a></li>
                        <li><a href="produits.html">Produits</a></li>
                        <li><a href="ingredients.html">Ingrédients</a></li>
                        <li><a href="recettes.html">Recettes</a></li>
                    </ul>
                </div>
                <h4> Auteurs : </h4>
                <ul>
                    <xsl:for-each select="Auteurs/Auteur">
                        <xsl:sort select="Nom" order="ascending"/>
                        <li>
                            <xsl:call-template name="Auteur"/>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
            <head>
                <link rel="stylesheet" href="indexStyle.css"></link>
            </head>
        </xsl:result-document>
        <xsl:result-document href="categories.html" format="my-output">
        <html>
            <head>
                <link rel="stylesheet" href="indexStyle.css"></link>
            </head>
            <body>
                <div id="menu">
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li><a href="auteurs.html">Auteurs</a></li>
                        <li><a href="categories.html">Categories</a></li>
                        <li><a href="produits.html">Produits</a></li>
                        <li><a href="ingredients.html">Ingrédients</a></li>
                        <li><a href="recettes.html">Recettes</a></li>
                    </ul>
                </div>
                <h4> Categories : </h4>
                <ul>
                    <xsl:for-each select="Categories/Categorie">
                        <li>
                            <xsl:call-template name="liste-catégories"/>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
        </xsl:result-document>
        <xsl:result-document href="produits.html" format="my-output">
        <html>
            <head>
                <link rel="stylesheet" href="indexStyle.css"></link>
            </head>
            <body>
                <div id="menu">
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li><a href="auteurs.html">Auteurs</a></li>
                        <li><a href="categories.html">Categories</a></li>
                        <li><a href="produits.html">Produits</a></li>
                        <li><a href="ingredients.html">Ingrédients</a></li>
                        <li><a href="recettes.html">Recettes</a></li>
                    </ul>
                </div>
            <h4> Produits : </h4>
                    <ul>
                        <xsl:for-each select="Produits/Produit">
                            <li>
                                <xsl:call-template name="liste-produits"/>
                            </li>
                        </xsl:for-each>
                    </ul>
            </body>
        </html>
        </xsl:result-document>
        <xsl:result-document href="ingredients.html" format="my-output">
        <html>
            <head>
                <link rel="stylesheet" href="indexStyle.css"></link>
            </head>
            <body>
                <div id="menu">
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li><a href="auteurs.html">Auteurs</a></li>
                        <li><a href="categories.html">Categories</a></li>
                        <li><a href="produits.html">Produits</a></li>
                        <li><a href="ingredients.html">Ingrédients</a></li>
                        <li><a href="recettes.html">Recettes</a></li>
                    </ul>
                </div>
                <h4> Ingrédients : </h4>
                <ul>
                    <xsl:for-each select="Ingredients/Ingredient">
                        <li>
                            <xsl:call-template name="liste-ingrédients"/>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
        </xsl:result-document>
        <xsl:result-document href="recettes.html" format="my-output">
        <html>
            <head>
                <link rel="stylesheet" href="indexStyle.css"></link>
            </head>
            <body>
                <div id="menu">
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li><a href="auteurs.html">Auteurs</a></li>
                        <li><a href="categories.html">Categories</a></li>
                        <li><a href="produits.html">Produits</a></li>
                        <li><a href="ingredients.html">Ingrédients</a></li>
                        <li><a href="recettes.html">Recettes</a></li>
                    </ul>
                </div>
                <xsl:for-each select="Categories/Categorie/Sous-categories/Sous-categorie/Recettes/Recette">
                    <xsl:sort select="Date" order="ascending"/>
                    <li>
                        <xsl:call-template name="liste-recettes"/>
                    </li>
                </xsl:for-each>
            </body>
        </html>
        </xsl:result-document>
    </xsl:template>

    <xsl:template name="Auteur">
        <div id="{@id}">
            <a href="#{@id}">
                <h3> <xsl:value-of select="Nom"/> </h3>
            </a>
            <p> Sexe : <xsl:value-of select="Sexe"></xsl:value-of> </p>
            <xsl:if test="normalize-space(Biographie) != ''">
                <p> Biographie : <xsl:value-of select="Biographie"></xsl:value-of> </p>
            </xsl:if>
            Recettes partagées :
            <ul>
                <xsl:for-each select="Recettes-partagees/Recette">
                    <li>
                        <a href="recettes.html#{id}">
                            <xsl:value-of select="Nom"/>
                        </a>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

    <xsl:template name="liste-recettes">
        <div id="{@id}">
            <a href="#{@id}">
                <h3> <xsl:value-of select="Titre"/> </h3>
            </a>
            <p> Auteur : <a href="auteurs.html#{Auteur/id}"> <h4> <xsl:value-of select="Auteur/Nom"/> </h4> </a></p>
            <xsl:if test="normalize-space(Note) != ''"> <p> Note : <xsl:value-of select="Note"> </xsl:value-of> <xsl:text/> étoiles</p> </xsl:if>
            <p>  Pour <xsl:value-of select="nbre_personnes"></xsl:value-of> personnes </p>
            <p> Préparation : <xsl:value-of select="Preparation"></xsl:value-of> </p>
            <img src="{Photo}"></img>
            <p> Ingrédients : <xsl:for-each select="Ingredients/Ingredient"> <xsl:value-of select="Quantite"/> <xsl:text> </xsl:text> <a href="ingredients.html#{id}"> <xsl:value-of select="Nom"/> </a>  <xsl:text> </xsl:text>  </xsl:for-each> </p>
            <p> Sous-catégorie : <a href="categories.html#{Sous-categorie/id}"> <xsl:value-of select="Sous-categorie/Nom"></xsl:value-of> </a> </p>
        </div>
    </xsl:template>

    <xsl:template name="liste-catégories">
        <div id="{@id}">
            <a href="#{@id}">
                <h3> <xsl:value-of select="Nom"/> </h3>
            </a>
            <p> Description : <xsl:value-of select="Description"/> </p>
            <ul>
                <xsl:for-each select="Sous-categories/Sous-categorie">
                    <li>
                        <xsl:call-template name="liste-sous-catégories"/>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

    <xsl:template name="liste-sous-catégories">
        <div id="{@id}">
            <a href="recettes.html#{@id}">
                <h3> <xsl:value-of select="Nom"/> </h3>
            </a>
            <p> Description : <xsl:value-of select="Description"/> </p>
        </div>
    </xsl:template>

    <xsl:template name="liste-ingrédients">
        <div id="{@id}">
            <a href="#{@id}">
                <h3> <xsl:value-of select="Nom"/> </h3>
            </a>
            <xsl:if test="normalize-space(Apport-nutritif) != ''">
            <p> Apport nutritif :  <xsl:value-of select="Apport-nutritif"></xsl:value-of>  </p>
            </xsl:if>
            <xsl:if test="normalize-space(Apport-energetique) != ''">
            <p> Apport-énergétique :  <xsl:value-of select="Apport-energetique"></xsl:value-of> </p>
            </xsl:if>
            <xsl:if test="normalize-space(Saison) != ''">
            <p> Saison :  <xsl:value-of select="Saison"></xsl:value-of> </p>
            </xsl:if>
            <xsl:if test="normalize-space(Description) != ''">
            <p> Descriptif :  <xsl:value-of select="descriptif"></xsl:value-of> </p>
            </xsl:if>
            Recettes en contenant :
            <ul>
                <xsl:for-each select="Recettes-contenant/Recette">
                    <li>
                        <a href="recettes.html#{id}">
                            <xsl:value-of select="Nom"/>
                        </a>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

    <xsl:template name="liste-produits">
        <div id="{@id}">
            <a href="#{@id}">
                <h3> <xsl:value-of select="Nom"/> </h3>
            </a>
            Ingrédients associés :
            <xsl:for-each select="Ingredients/Ingredient">
                <li>
                    <a href="ingredients.html#{id}">
                        <xsl:value-of select="Nom"/>
                    </a>
                </li>
            </xsl:for-each>
        </div>
    </xsl:template>

</xsl:stylesheet>