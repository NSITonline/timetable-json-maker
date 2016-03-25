<?php
/**
 * @Author: prabhakar
 * @Date:   2016-03-25 23:51:01
 * @Last Modified by:   Prabhakar Gupta
 * @Last Modified time: 2016-03-26 00:14:36
 */
 
ob_start();
session_start();


/**
 * function to check if someone is logged in or not
 * @return boolean
 */
function loggedIn(){
	return (bool)(isset($_SESSION['pass']) && !empty($_SESSION['pass']));
}


/**
 * function to return the roman form of any positive integer
 * @param  integer 	$integer
 * @param  boolean 	$upcase		check if uppercase is required or not
 * @return string
 */
function romanic_number($integer, $upcase = true){ 
    $table = array('M'=>1000, 'CM'=>900, 'D'=>500, 'CD'=>400, 'C'=>100, 'XC'=>90, 'L'=>50, 'XL'=>40, 'X'=>10, 'IX'=>9, 'V'=>5, 'IV'=>4, 'I'=>1);
    $return = '';
    while($integer > 0){ 
        foreach($table as $rom => $arb){ 
            if($integer >= $arb){ 
                $integer -= $arb; 
                $return .= $rom; 
                break; 
            }
        }
    }
    return $return; 
} 


/**
 * function to return the current URL of the page
 * @return string
 */
function returnCurrentURL(){
    return "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
}