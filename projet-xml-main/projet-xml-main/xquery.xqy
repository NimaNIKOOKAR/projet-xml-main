xquery version "3.1";
let $Auteurs := doc("/amuhome/k20006922/IdeaProjects/projet-xml/getData.xml")//Auteurs/Auteur

return
<html xmlns="http://www.w3.org/1999/xhtml">
  <body>
    <h1> Liste des auteurs, de leurs recettes et les sous catégories auxquelles elles appartiennent </h1>

    {
      for $Auteur in $Auteurs
      order by $Auteur

      return
         <div>
          <h2>{ data($Auteur) }</h2>
          <ul>

          </ul>
        </div>
    }
  </body>
</html>
