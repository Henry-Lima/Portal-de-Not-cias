<?php
// Inicia a sessão
session_start();

// Verifica se o usuário está logado e se o tipo de usuário é válido
if (!isset($_SESSION['tipo_usuario']) || !in_array($_SESSION['tipo_usuario'], ['leitor', 'administrador', 'escritor'])) {
    header('Location: index.php');
    exit;
}
// Obtém o tipo de usuário da sessão
$tipo_usuario = $_SESSION['tipo_usuario'];

// Conecta ao banco de dados
$host  = "localhost:3306";
$user  = "root";
$pass  = "";
$base  = "jornal";
$conexao = mysqli_connect($host, $user, $pass, $base);

// Verifica se a conexão foi bem-sucedida
if (!$conexao) {
    die("Erro ao conectar ao banco de dados: " . mysqli_connect_error());
}

// Consulta as matérias aprovadas
$query = "SELECT * FROM materia WHERE status = 1";
$resultado = mysqli_query($conexao, $query);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="leitor.css">
</head>
<body>
    <header>
    <a href="<?php echo ($tipo_usuario == 'administrador') ? 'administrador.php' : 'escritor.php'; ?>" class="btn-voltar">
        <button type="button">Voltar</button>
    </a>
    <a href='logout.php' class='logout-btn'>
        Logout
    </a>
    </header>

    <?php
    // Verifica se há matérias aprovadas
    if (mysqli_num_rows($resultado) == 0) {
        echo "Não há matérias aprovadas.";
    } else {
        // Exibe as matérias aprovadas
        while ($row = mysqli_fetch_assoc($resultado)) {
            echo "
                <header>
                    <div class='cabecalho'>
                        <p id='data'>Data: " . $row['data'] . "</p>
                         <h1 id='titulo'>Coringão Times</h1>
                        <p id='escritor'>Nome do escritor: " . $row['nom_esc'] . "</p>
                    </div>
                </header>
                <div class='manchete_div'>
                    <h2 class='manchete'>" . $row['manchete'] . "</h2>
                </div>
                <img src='" . $row['imagem'] . "' alt='Imagem da matéria' style='max-width: 100%;'>
                <div class='div_resumo'>
                    <p id='resumo'>" . $row['res_mat'] . "</p>
                </div>
                <div class='texto'>
                    <p>" . $row['text_mat'] . "</p>
                </div>";
        }
    }

    // Fecha a conexão com o banco de dados
    mysqli_close($conexao);
    ?>
</body>
</html>
