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
$db = new db();
$top_id=($esb->get_value($_POST['top_name'], 'topics','id'));

$db = new DB();
$con = $db->connect();
if ($con) {
    $results = array();
    $cQuery = "SELECT topic_count as top_last, message as msg FROM messages WHERE (topic_id = ".$top_id." and topic_count>".$_POST['top_last'].")";
    $stmt = $con->query($cQuery);
    while($row = $stmt->fetch())
        $results[] = $row;

    $stmt = null;
    $db->disconnect($con);
    
    echo json_encode($results);

} else {
    echo false;
}

?>