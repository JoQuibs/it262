<?php
//form.php

if(isset($_POST["FirstName"])) {
    // echo $_POST["FirstName"];
    //echo '<pre>';
    //var_dump($_POST);
    //echo '</pre>';

    $fav = implode(', ',  $_POST["FavoriteToppings"]);

    echo "<p>Your first name is: {$_POST["FirstName"]}</p>";
    echo "<p>Your favorite is: {$_POST["FavoriteColor"]}</p>";
    echo "<p>Your favorite pizza topping(s): $fav </p>";
} else {
    echo'
    <form action="" method="POST">
    <p>First Name: <input type="text" name="FirstName" /></p>
    <fieldset>
    <legend>Favorite Color</legend>
    <p><input type="radio" name="FavoriteColor" value="red" />Red</p>
    <p><input type="radio" name="FavoriteColor" value="blue" />Blue</p>
    <p><input type="radio" name="FavoriteColor" value="yellow" />Yellow</p>
    </fieldset>
    <fieldset>
    <legend>Favorite Pizza Toppings</legend>
    <p><input type="checkbox" name="FavoriteToppings[]" value="sausage" />Sausage</p>
    <p><input type="checkbox" name="FavoriteToppings[]" value="cheese" />Cheese</p>
    <p><input type="checkbox" name="FavoriteToppings[]" value="sauce" />Sauce</p>
    </fieldset>
    <p><input type="submit" /></p>
    </form>
    ';
}