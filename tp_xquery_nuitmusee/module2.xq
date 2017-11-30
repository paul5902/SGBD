module namespace mm2 = "http://www.biblioFonction2.fr";

declare default element namespace "http://www.w3.org/1999/xhtml";

declare namespace ndm = "http://www.fil.univ-lille1.fr/~caronc/nuitDesMusees";

declare function mm2:generate($name as xs:string,$db as document-node()+) as element(html)
{
  <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="cours.css" rel="stylesheet" type="text/css" />
    <title>Nuit des musées 2015</title>
  </head>
  <body>
    {if (exists($db//ficheInscription/lieuRegion/text()=$name))
      then <h1>Département : {$db/ficheInscription[lieuRegion/text()=$name]/lieuCodePostal/text()}</h1>
      else <h1>Pays : {$name}</h1>
    }
  </body>
  </html>
};
