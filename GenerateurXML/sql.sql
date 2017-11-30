--1-------------------
select xmlelement(name "pays",nom)
from pays;

--2-----------------

select xmlelement(name "pays",
  xmlforest (ref_pays as refPays, nom as Nom, nb_habitants as nbHabitants)
  )
from pays;

--3-----------------

select xmlelement(name "pays",
  xmlattributes(ref_pays as refPays),xmlforest(nom as Nom, nb_habitants as nbHabitants)
  )
from pays;

--4---------------

select xmlelement(name "les_pays",
  xmlagg(
    xmlelement(name "pays",
      xmlattributes(ref_pays as refPays),xmlforest(nom as Nom, nb_habitants as nbHabitants)
  )
  )
)
from pays;

--5------------------

select xmlelement(name "ville",
  xmlelement(name "nom",ville.nom), xmlelement(name "pays", pays.nom)
  )
from ville
join pays on ville.ref_pays = pays.ref_pays;


--6 ---------------

--- Avec jointure ----
select xmlelement(name "pays",
  xmlattributes(pays.ref_pays as ID, pays.nom as NOM),
  xmlagg(
    xmlelement(name "ville", ville.nom)
  )
)
from pays
join ville on pays.ref_pays = ville.ref_pays
group by pays.ref_pays, pays.nom;


--- Avec sous requête ----
select xmlelement(name "pays",
  xmlattributes(pays.ref_pays as ID, pays.nom as NOM),
  (select xmlagg(
    xmlelement(name "ville", ville.nom)
    )
    from ville
    where ville.ref_pays = pays.ref_pays
  )
)
from pays;

---7---
select xmlelement(name "pays",
  xmlattributes((select count(ville.ref_ville) from ville where ville.ref_pays = pays.ref_pays) as NB_VILLES),
  pays.nom
  )
from pays;


---8----

select xmlelement(name "les_pays",
xmlagg(
  xmlelement(name "pays",
    xmlattributes(pays.ref_pays as ID), xmlelement(name nom, pays.nom), xmlelement(name "villes",
      xmlelement(name "ville", xmlforest(ville.nom, ville.nb_habitants))
    )
  )
)
)
from pays
join ville on pays.ref_pays = ville.ref_pays;
    
    






