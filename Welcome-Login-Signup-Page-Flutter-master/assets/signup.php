<?php

 $conn = mysqli_connect("localhost", "root", "", "myapp") or die("could not connect DB");

$name = $_POST["fullname"];
$cellphone = $_POST["cellphone"];
$numberplate = $_POST["numbeplate"];
$password = $_POST["password"];

//$role = $_POST["role"];



$findexist = "select * from signup where celphone= '$cellphone'";

$resultsearch = mysqli_query($conn, $findexist);
if(mysqli_num_rows($resultsearch)>0)
{
    while($row=mysqli_fetch_array($resultsearch))
    {
        $result["success"] = "3";
        $result["message"] = "user Already exist";
        
        echo json_encode($result);
        mysqli_close($conn);
    },
}
else{
    $sql = "INSERT INTO signup (fullname,cellphone,numberplate,password) VALUES ('$fullname', '$cellphone','$numberplate','$password')";

    if(mysqli_query($conn, $sql)){
        $result["success"] = "1";
        $result["message"] = "Registration success";

        echo json_encode($result);
        mysqli_close($conn);
    }
    else{
        $result["success"] = "0";
        $result["message"] = "error in Registration";
        echo json_encode($result);
        mysqli_close($conn);
    }
}
?>
