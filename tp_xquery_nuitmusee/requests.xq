import module namespace mm = "http://www.biblioFonction.fr" at 'module.xq';

declare default element namespace
"http://www.fil.univ-lille1.fr/~caronc/nuitDesMusees";

let $db := db:open("NDM_data")

(: EXERCICE 1:)

(: QUESTION 1 :)

(:return mm:getFichesInscription("Autour d'un thème régional",$db):)

(: QUESTION 2 :)

(:return mm:getNbInscriptionsEtOffres($db):)


