<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=?, initial-scale=1.0">
    <link rel="stylesheet" href="administrador.css">
    <title>Document</title>
</head>
<body>
<header class="cabecalho">
    <h1 id="titulo">Coringão Times</h1>
    <div class="botao-container">
        <a href="leitor.php" class="logout-btn">
            <button type="button">Notícias</button>
        </a>
        <a href="logout.php" class="logout-btn">
            <button type="button">Logout</button>
        </a>
    </div>
</header>
    
    <?php
session_start();
if (!isset($_SESSION['tipo_usuario']) || $_SESSION['tipo_usuario'] != 'administrador') {
    header('Location: index.php');
    exit;
}

$host  = "localhost:3306";
$user  = "root";
$pass  = "";
$base  = "jornal";
$conexao = mysqli_connect($host, $user, $pass, $base);

if (!$conexao) {
    die("Erro ao conectar ao banco de dados: " . mysqli_connect_error());
}

$query = "SELECT * FROM materia WHERE status = 0";
$resultado = mysqli_query($conexao, $query);

echo "<h1>Matérias Pendentes</h1>";
if (mysqli_num_rows($resultado) > 0) {
    echo "<table border='1'>
            <tr>
                <th>Data</th>
                <th>Nome do Escritor</th>
                <th>Manchete</th>
                <th>Resumo</th>
                <th>Imagem</th>
                <th>Ações</th>
            </tr>";

    while ($row = mysqli_fetch_assoc($resultado)) {
        echo "<tr>
                <td>" . htmlspecialchars($row['data']) . "</td>
                <td>" . htmlspecialchars($row['nom_esc']) . "</td>
                <td>" . htmlspecialchars($row['manchete']) . "</td>
                <td>" . htmlspecialchars($row['res_mat']) . "</td>
                <td><img src='" . htmlspecialchars($row['imagem']) . "' width='100' height='100'></td>
                <td>
                    <a href='aprovar.php?id=" . htmlspecialchars($row['id']) . "'>Aprovar</a> 
                </td>
                    <td>
                    <a href='rejeitar.php?id=" . htmlspecialchars($row['id']) . "'>Rejeitar</a>
                    <td>
                </tr>";
    }
    echo "</table>";
} else {
    echo "<p id='n_mat_pend'>Não há matérias pendentes.</p>";
}

mysqli_close($conexao);
?>
  
</body>
</html>