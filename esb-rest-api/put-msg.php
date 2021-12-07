<?php
/**
 * put-msg backend API
 * 
 * @author  Abul,Abdul & Wajid
 * @version 2.0 November 2021
 */
require_once("esbdb.php");
if($_POST['top_name']==''||$_POST['msg']==''||$_POST['pub_name']==''){
    echo json_encode(FALSE);
}
else{
    $esb = new Esb();
    $pub_id=$esb->get_value($_POST['pub_name'], 'publishers','id');
    if($pub_id==0) echo ("Publisher does not exist.");
    else{
        $top_id=$esb->get_value($_POST['top_name'], 'topics','id');
        if($top_id==0) $top_id=$esb->create_id($_POST['top_name'], 'topics');
        $top_count=$esb->update('topics',$top_id, (($esb->get_value($_POST['top_name'], 'topics','top_last'))+1),'top_last');
        $db = new DB();
        $con = $db->connect();
        if ($con) {
            $cQuery = "INSERT INTO messages (topic_id,publisher_id, message,topic_count,date_time) VALUES (".$top_id.",".$pub_id.",'".$_POST['msg']."',".$top_count.",'".date('Y-m-d H:i:s')."')";

            $stmt = $con->prepare($cQuery);
            $ok = $stmt->execute();

            $stmt = null;                
            $db->disconnect($con);
            
            echo json_encode($ok);

        } else {
            echo false;
        }
    }
}

?>