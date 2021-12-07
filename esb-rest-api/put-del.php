<?php
/**
 * Main backend API
 * 
 * @author  Abul,Abdul & Wajid
 * @version 2.0 November 2021
 */
require_once("esbdb.php");
require_once("db.php");
$esb = new Esb();
$con_id=$esb->get_value($_POST['con_name'], 'consumers','id');
if($con_id==0) $con_id=$esb->create_id($_POST['con_name'], 'consumers');
$msg_id=$esb->get_msg_id(($esb->get_value($_POST['top_name'], 'topics','id')),$_POST['top_last']);
$db = new DB();
$con = $db->connect();
if ($con) {
    $cQuery = 'INSERT INTO ' .
        'delivered' .
        '(message_id,consumer_id,topic_count) ' .
        'VALUES (?,?,?)';

    $stmt = $con->prepare($cQuery);
    $ok = $stmt->execute([$msg_id,$con_id,$_POST['top_last']]);

    $stmt = null;                
    $db->disconnect($con);
    
    echo json_encode ($ok);

} else {
    echo false;
}
?>
