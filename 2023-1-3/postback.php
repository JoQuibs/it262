<?php
// postback.php

if(isset($_POST["FirstName"])) {
    //show data
    echo $_POST["FirstName"];
} else {
    //show form
    echo '
    <form action="" method="POST">
    <p>First Name <input type="text" name="FirstName" /></p>
    <input type="submit" />
    
    ';
}