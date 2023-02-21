<?php

//classes2.php

$cars[] = new Car('Chevrolet', 'Camaro', 40500, 'yellow');
$cars[] = new Car('Ford', 'Mustang', 21895, 'black');
$cars[] = new Car('Toyota', 'Supra', 10000, 'red');

$total = 0;

foreach($cars as $myCar) {
    echo "<p>My car is a $myCar->make $myCar->model that has $myCar->mileage miles on the odometer</p>";
    $total += $myCar->mileage;
}

$carCount = count($cars);
$average = $total/$carCount;
$average = number_format($average, 2);

echo "<p>I have $carCount and the average mileage is $average</p>";


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