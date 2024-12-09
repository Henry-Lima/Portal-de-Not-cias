<?php

$host = 'localhost:3306';       
$dbname = 'jornal'; 
$user = 'root';            
$password = '';            


$conn = new mysqli($host, $user, $password, $dbname);

// Verifica se houve erro na conexão
if ($conn->connect_error) {
    die("Erro na conexão com o banco de dados: " . $conn->connect_error);
}
?>

<?php
   $login = $_POST['login'];
   $senha = $_POST['senha'];
   $host = "localhost:3306";
   $user = "root";
   $pass = "";
   $base = "jornal";
   $conexao = mysqli_connect($host, $user, $pass, $base);
   $sql = "select * from login where email = '$login' AND senha = '$senha'";
   $resultado = mysqli_query($conexao, $sql);

   if ( mysqli_num_rows($resultado) > 0)
   
   {
        echo "Acesso liberado";
    }
    else
    {
            echo "Acesso negado";
        }
  ?>