<?php
/**
 * Main backend API
 * 
 * @author  Abul,Abdul & Wajid
 * @version 2.0 November 2021
 */
require_once("esbdb.php");
if($_POST['pub_name']==''||$_POST['phone']==''){
    echo json_encode(FALSE);
}
else{
    $esb = new Esb();
    $id_return =  ($esb->get_value($_POST['pub_name'], 'publishers','id'));
    if ($id_return==0){
        $esb->create_id($_POST['pub_name'], 'publishers');
        $updated=($esb->update('publishers',($esb->get_value($_POST['pub_name'], 'publishers','id')), $_POST['phone'],'phone'));
        if ($updated==$_POST['phone'])
            echo json_encode(TRUE);
        else    echo json_encode(FALSE);
    }
    else    echo json_encode(FALSE);
}

            
?>