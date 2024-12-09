<?php
// Conexão com o banco de dados
$host  = "localhost:3306";
$user  = "root";
$pass  = "";
$base  = "jornal";
$conexao  = mysqli_connect($host, $user, $pass, $base);

// Verifica se o ID foi passado via GET
if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Atualiza o status da matéria para "aprovada"
    $query = "UPDATE materia SET status = 1 WHERE id = $id";
    $result = mysqli_query($conexao, $query);

    if ($result) {
        // Redireciona para a página de administração após a aprovação
        header('Location: administrador.php');
        exit;
    } else {
        echo "Erro ao atualizar o status da matéria.";
    }
}

$query = "UPDATE materia SET status = 1 WHERE id = $id";

mysqli_close($conexao);
?>