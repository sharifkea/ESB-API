<?php
/**
 * update password publishers in  backend API
 * 
 * @author  Abul,Abdul & Wajid
 * @version 2.0 November 2021
 */
require_once("esbdb.php");
if($_POST['pub_name']==''||$_POST['pass']==''){
    echo json_encode(FALSE);
}
else{
    $esb = new Esb();     
    echo json_encode($esb->update('publishers',($esb->get_value($_POST['pub_name'], 'publishers','id')), $_POST['pass'],'pass'));
}
          
?>
