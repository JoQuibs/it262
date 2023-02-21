<?php

//classes.php

$myCar = new Car('Chevrolet', 'Camaro 2018', 40500, 'yellow');

// echo $myCar->mileage;

echo '<pre>';
var_dump($myCar);
echo '</pre>';

class Car {

public $make = '';
public $model = '';
public $mileage = 0;
public $color = '';


public function _construct($make, $model, $mileage, $color) {
    $this->make = $make;
    $this->model = $model;
    $this->mileage = $mileage;
    $this->color = $color;
}


}