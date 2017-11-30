module namespace mm = "http://www.biblioFonction.fr";

declare default element namespace
"http://www.fil.univ-lille1.fr/~caronc/nuitDesMusees";
(: QUESTION 1 :)
declare function mm:getFichesInscription($libelle as xs:string,$db as document-node()+) as element(fichesInscription)
{
  <fichesInscription>
    {for $fiche in $db//ficheInscription[offres/offre/themes/theme/libelle/text()=$libelle]
      return <ficheInscription>
      {$fiche/lieuNom}
      {$fiche/lieuCommune}
      {$fiche/lieuRegion}
      {$fiche/lieuPays}
      <offres>
      {for $offre in $fiche/offres/offre
        return <offre>
        {$offre/titre}
        {$offre/dateDebut}
        {$offre/dateFin}
        {$offre/horaires}
        </offre>
        
      }
      </offres>
      
      </ficheInscription>


    }

  </fichesInscription>
};

(: QUESTION 2 :)
declare function mm:getNbInscriptionsEtOffres($db as document-node()+) as element(classement)
{
  <classement>
    {for $region in distinct-values($db//ficheInscription[lieuPays/text()="France"]/lieuRegion/text()), $nbFiche in count($db//ficheInscription[lieuRegion/text()=$region]), $nbOffres in count($db//ficheInscription[lieuRegion/text()=$region]/offres/offre)
      order by $nbFiche descending
      return <region> {
        attribute{"nom"}
        {
          $region
        },
        <nb_fiches>{$nbFiche}</nb_fiches>,
        <nb_offres>{$nbOffres}</nb_offres>
    }
    </region>
    }
  </classement>
};