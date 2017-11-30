import module namespace mm2 = "http://www.biblioFonction2.fr" at 'module2.xq';
declare option output:method "xhtml";

let $db := db:open("NDM_data")
