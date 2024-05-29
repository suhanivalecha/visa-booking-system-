<?php

$servername = "localhost";  
$username = "visa application quesry";     
$password = "root";     
$database = "visa ";     


$conn = new mysqli($servername, $username, $password, $database);


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


if ($_SERVER["REQUEST_METHOD"] == "POST") {
   
    $application_id = $_POST["application_id"];
    $start_date = $_POST["start_date"];
    $end_date = $_POST["end_date"];
    

    $sql = "INSERT INTO visa_renewal_application (reference_number, start_date , end_date , country) VALUES ('$application_id', '$start_date', '$end_date', 'USA')";
    
    if ($conn->query($sql) === TRUE) {
        echo "Renewal information added successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}


$conn->close();
?>
