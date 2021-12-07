<?php
/**
 * Encapsulates a connection to the database * 
 * @author  Abul,Abdul & Wajid
 * @version 2.0 November 2021
 */
    class DB {

        /**
         * Opens a connection to the database
         * 
         * @returns a connection object
         */
        public function connect() {
            $cServer = 'localhost';
            $cDB = 'esbdb';
            $cUser = 'root';
            $cPwd = 'rony2204';

            $cDSN = 'mysql:host=' . $cServer . ';dbname=' . $cDB . ';charset=utf8';
            $cOptions = [
                PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES   => false,
            ];

            try {
                $cnDB = @new PDO($cDSN, $cUser, $cPwd, $cOptions); 
            } catch (\PDOException $oException) {
                echo 'Connection unsuccessful';
                die('Connection unsuccessful: ' . $cnDB->connect_error());
                exit();
            }
            
            return($cnDB);   
        }

        /**
         * Closes a connection to the database
         * 
         * @param the connection object to disconnect
         */
        public function disconnect($pcnDB) {
            $pcnDB = null;
        }
    }
?>