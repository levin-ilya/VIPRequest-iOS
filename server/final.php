<?php 
require_once "Mail.php";
header('Content-type: application/json');


if ($_GET["method"]=="vipRequest")
  {
 $name = urldecode($_GET["name"]);
 $guests =  urldecode($_GET["guest"]);
 $table = urldecode($_GET["table"]);
 $contactPrefs = urldecode($_GET["contactPrefs"]);
 $contact = urldecode($_GET["contact"]);
 $promoContact = urldecode($_GET["promoContact"]);
 $header = "From: ". "Final Project" . " <" . "ilevin@fas.harvard.edu" . ">\r\n";
 
 $message = "New VIP Request!\n\nName: " . $name . "\nNumber of Guests: " . $guests . "\nTable:" . $table . "\nContact Preferences: " . $contactPrefs . "\nContact Information: " . $contact;
 
        $from = "Final Project <classproject@webbiebuilder.com>";
 	$to = "Promotor <".  $promoContact. ">";
 	$subject = "New VIP Request";
        $body = $message;
 
	 $host = "mail.webbiebuilder.com";
         $username = "classproject@webbiebuilder.com";
         $password = "greatclass!!";
 
         $headers = array ('From' => $from,'To' => $to,'Subject' => $subject);
         $smtp = Mail::factory('smtp',array ('host' => $host,'auth' => true,'username' => $username,'password' => $password));
 
         if($contactPrefs == "e-Mail" && !filter_var($contact, FILTER_VALIDATE_EMAIL)){
         	echo '{"results":"Error","message":"Invaild email address"}';
         	exit(0);
         }
         
         
         $mail = $smtp->send($to, $headers, $body);
 
	 if (!PEAR::isError($mail)){
  	echo '{"results":"Success","message":"Request sent!"}';
  }else{
  	 echo '{"results":"Error","message":"Request can\'t be sent"}';
  }
 
  }else if($_GET["method"]=="emailtest"){
  	$from = "Final Project <classproject@webbiebuilder.com>";
 	$to = "Promotor <ilya1113@gmail.com>";
 	$subject = "Hi!";
        $body = "Hi,\n\nHow are you?";
 
	 $host = "mail.webbiebuilder.com";
         $username = "classproject@webbiebuilder.com";
         $password = "greatclass!!";
 
         $headers = array ('From' => $from,'To' => $to,'Subject' => $subject);
         $smtp = Mail::factory('smtp',array ('host' => $host,'auth' => true,'username' => $username,'password' => $password));
 
         $mail = $smtp->send($to, $headers, $body);
 
	 if (PEAR::isError($mail)) {
	   echo("<p>" . $mail->getMessage() . "</p>");
	  } else {
	   echo("<p>Message successfully sent!</p>");
	  }
	  
  	}
  else{
   echo '{"results":"Error","message":"Unknown Method"}';
 
}
?>