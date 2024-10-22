<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />
    <xsl:template match="/">
        <App>
            <Categories>
                <xsl:for-each select="//objet[@type = 'catégorie']">
                    <Categorie id="{@id}">
                        <Nom> <xsl:value-of select="info[@nom='nom']/@value"/></Nom>
                        <Description> <xsl:value-of select="info[@nom='descriptif']"/> </Description>
                        <Sous-categories>
                            <xsl:for-each select="//objet[@type = 'sous-catégorie' and info[@nom='catégorie']/@value = current()/@id]">
                                <Sous-categorie id="{@id}">
                                    <Nom> <xsl:value-of select="info[@nom='nom']/@value"/> </Nom>
                                    <Description> <xsl:value-of select="info[@nom='descriptif']"/> </Description>
                                    <Recettes>
                                        <xsl:for-each select="//objet[@type = 'recette' and info[@nom='sous-catégorie']/@value = current()/@id]">
                                            <Recette id="{@id}">
                                                <Titre><xsl:value-of select="info[@nom='nom']/@value"/></Titre>
                                                <Auteur>
                                                    <Nom><xsl:value-of select="//objet[@type='auteur' and @id=current()/info[@nom='auteur']/@value]/info[@nom='idext']/@value"/></Nom>
                                                    <id><xsl:value-of select="info[@nom='auteur']/@value"/></id>
                                                </Auteur>
                                                <Sous-categorie>
                                                    <Nom><xsl:value-of select="//objet[@type='sous-catégorie' and @id=current()/info[@nom='sous-catégorie']/@value]/info[@nom='nom']/@value"/></Nom>
                                                    <id> <xsl:value-of select="info[@nom='sous-catégorie']/@value"/></id>
                                                </Sous-categorie>
                                                <Note> <xsl:value-of select="info[@nom='note']/@value"/> </Note>
                                                <nbre_personnes><xsl:value-of
                                                        select="info[@nom='nbre_personnes']/@value"/></nbre_personnes>
                                                <Preparation>
                                                    <xsl:copy-of select="info[@nom='Préparation']/*"/></Preparation>
                                                <Resume> <xsl:copy-of select="info[@nom='résumé']/*"/></Resume>
                                                <Photo><xsl:value-of select="info[@nom='photo']/@value"/></Photo>
                                                <Date><xsl:value-of select="info[@nom='date_publication']/@value"/></Date>
                                                <Difficulte><xsl:value-of select="info[@nom='difficulté']/@value"/></Difficulte>
                                                <Ingredients>
                                                    <xsl:for-each select="info[@nom = 'ingrédient']">
                                                    <Ingredient>
                                                            <Quantite><xsl:value-of select="@quantite"/></Quantite>
                                                            <id><xsl:value-of select="@value"/></id>
                                                            <Nom> <xsl:value-of select="//objet[@type='ingrédient' and @id=current()/@value]/info[@nom='nom']/@value"/></Nom>
                                                    </Ingredient>
                                                    </xsl:for-each>
                                                </Ingredients>
                                            </Recette>
                                        </xsl:for-each>
                                    </Recettes>
                                </Sous-categorie>
                            </xsl:for-each>
                        </Sous-categories>
                    </Categorie>
                </xsl:for-each>
            </Categories>
            <Ingredients>
                <xsl:variable name="recettes" select="//objet[@type='recette']"/>
                <xsl:for-each select="//objet[@type = 'ingrédient']">
                    <Ingredient id="{@id}">
                        <Produit>
                            <id> <xsl:value-of select="info[@nom='produit']/@value"/></id>
                            <Nom><xsl:value-of select="//objet[@type='produit' and @id=current()/info[@nom='produit']/@value]/info[@nom='nom']/@value"/></Nom>
                        </Produit>
                        <Nom><xsl:value-of select="info[@nom='nom']/@value"/> </Nom>
                        <Apport-nutritif><xsl:value-of select="info[@nom='Apport nutritif']/@value"/></Apport-nutritif>
                        <Apport-energetique><xsl:value-of select="info[@nom='Apport énergétique']/@value"/></Apport-energetique>
                        <Saison><xsl:value-of select="info[@nom='saison']/@value"/></Saison>
                        <Recettes-contenant>
                        <xsl:for-each select="info[@nom='recette']">
                            <Recette>
                                <id> <xsl:value-of select="@value"/></id>
                                <Nom>
                                    <xsl:value-of select="$recettes[@id=current()/@value]/info[@nom='nom']/@value"/>
                                </Nom>
                            </Recette>
                        </xsl:for-each>
                        </Recettes-contenant>
                        <Descriptif> <xsl:copy-of select="info[@nom='descriptif']/*"/></Descriptif>
                    </Ingredient>
                </xsl:for-each>
            </Ingredients>
            <Auteurs>
                <xsl:variable name="recettes" select="//objet[@type='recette']"/>
                <xsl:for-each select="//objet[@type = 'auteur']">
                    <Auteur id="{@id}">
                        <Nom><xsl:value-of select="info[@nom='idext']/@value"/> </Nom>
                        <Pays><xsl:value-of select="info[@nom='pays']/@value"/> </Pays>
                        <Sexe><xsl:value-of select="info[@nom='sexe']/@value"/> </Sexe>
                        <Biographie><xsl:value-of select="info[@nom='biographie']/@value"/> </Biographie>
                        <Recettes-partagees>
                        <xsl:for-each select="info[@nom='recette']">
                            <Recette>
                                <Nom>
                                    <xsl:value-of select="$recettes[@id=current()/@value]/info[@nom='nom']/@value"/>
                                </Nom>
                            <id>
                                <xsl:value-of select="@value"/>
                            </id>
                            </Recette>
                        </xsl:for-each>
                        </Recettes-partagees>
                    </Auteur>
                </xsl:for-each>
            </Auteurs>
            <Produits>
                <xsl:for-each select="//objet[@type = 'produit']">
                    <Produit id="{@id}">
                        <Nom><xsl:value-of select="info[@nom='nom']/@value"/></Nom>
                        <Ingredients>
                            <xsl:for-each select="info[@nom = 'ingrédient']">
                                <Ingredient>
                                    <id> <xsl:value-of select="@value"/> </id>
                                    <Nom> <xsl:value-of select="//objet[@type='ingrédient' and @id=current()/@value]/info[@nom='nom']/@value"/></Nom>
                                </Ingredient>
                            </xsl:for-each>
                        </Ingredients>
                    </Produit>
                </xsl:for-each>
            </Produits>
        </App>
    </xsl:template>
</xsl:stylesheet>