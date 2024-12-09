<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Conexão com o banco de dados
    $host  = "localhost:3306";
    $user  = "root";
    $pass  = "";
    $base  = "jornal";
    $conexao = mysqli_connect($host, $user, $pass, $base);

    if (!$conexao) {
        die("Erro ao conectar ao banco de dados: " . mysqli_connect_error());
    }

    $data = $_POST["data"];
    $nome = $_POST["nom_esc"];   
    $manchete = $_POST["manchete"];
    $resumo = $_POST["res_mat"];
    $texto = $_POST["text_mat"];

    // Upload da imagem
    $imagem = "";
    if (isset($_FILES['imagem']) && $_FILES['imagem']['error'] === UPLOAD_ERR_OK) {
        $nomeArquivo = basename($_FILES['imagem']['name']);
        $diretorioDestino = 'uploads/';

        // Garante que o diretório de uploads existe
        if (!file_exists($diretorioDestino)) {
            mkdir($diretorioDestino, 0777, true);
        }

        $caminhoDestino = $diretorioDestino . $nomeArquivo;

        // Move o arquivo para o diretório de uploads
        if (move_uploaded_file($_FILES['imagem']['tmp_name'], $caminhoDestino)) {
            $imagem = $caminhoDestino; // Caminho salvo no banco
        } else {
            echo "Erro ao fazer o upload da imagem.";
            exit;
        }
    }

    // Inserção no banco de dados
    $query = "
    INSERT INTO materia (data, nom_esc, manchete, res_mat, text_mat, imagem, status)
    VALUES ('$data', '$nome', '$manchete', '$resumo', '$texto', '$imagem', 0);
";
    
    if (mysqli_query($conexao, $query)) {
        echo "<center><h1>Cadastro realizado. A matéria está aguardando aprovação.</h1></center>";
        echo "<script>
                setTimeout(function() {
                    window.location.href = 'escritor.php';
                }, 3000);
              </script>";
    } else {
        echo "Erro ao cadastrar a matéria: " . mysqli_error($conexao);
    }

    mysqli_close($conexao);
}
?>
</body>
</html>

