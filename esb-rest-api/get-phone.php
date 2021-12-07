<?php
/**
 * Main backend API
 * 
 * @author  Abul,Abdul & Wajid
 * @version 2.0 November 2021
 */
require_once("esbdb.php");

$esb = new Esb();   
echo json_encode($esb->get_value($_POST['pub_name'], 'publishers','phone'));
            
?>