--Question 1
insert into TXML
select xmlelement(name "pays",
  xmlattributes(pays.ref_pays as ID),
  xmlelement(name "nom", pays.nom),
  xmlagg(
    xmlelement(name "ville", ville.nom)
  )
)
from pays
join ville on pays.ref_pays = ville.ref_pays
group by pays.ref_pays, pays.nom;

-- Question 2

--1 

select XMLQuery('/pays/ville' PASSING OBJECT_VALUE Rdelete from TXML;
ETURNING CONTENT)
  as ville
from TXML;

--2


--Question 3

select xmlelement(name "les_villes",
  xmlagg(
    XMLQuery('/pays/ville' PASSING OBJECT_VALUE RETURNING CONTENT)
  )
)
from TXML;

--4

update TXML set OBJECT_VALUE = updateXML(OBJECT_VALUE, '/pays/nom/text()', UPPER (XMLQuery('/pays/nom/text()' PASSING OBJECT_VALUE RETURNING CONTENT)));

delete from TXML;

--5
update TXML set OBJECT_VALUE = insertChildXML(OBJECT_VALUE,'/pays[nom/text()="france"]','ville', XMLType('<ville>Rennes</ville>'));


