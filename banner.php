<?php

  $query="SELECT count(IMAGES) as 'counts'  FROM `promo` pr , `produit` p  
  WHERE pr.`PROID`=p.`PROID` and `PROBANNER`=1";
  $mydb->setQuery($query);
  $cur = $mydb->loadResultList(); 
  foreach ($cur as $result) {
  $maxrow = $result->counts; 
  }
 
?>
 

