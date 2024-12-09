<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="escritor.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<header class="cabecalho">
    <h1 id="titulo">Coringão Times</h1>
    <div class="botao-container">
        <a href="leitor.php" class="logout-btn noticias">
            <button type="button">Notícias</button>
        </a>
        
        <a href="logout.php" class="logout-btn">
            <button type="button">Logout</button>
        </a>
    </div>
</header>

    <form action="validaMateria.php" method="POST" enctype="multipart/form-data">
        <label class="label" for="data">Data:</label>
        <input class="input" name="data" id="data" type="date" required>
        
        <label class="label" for="nom_esc">Nome do Escritor</label>
        <input class="input" name="nom_esc" id="nom_esc" type="text" required>
        
        <label class="label" for="manchete">Manchete:</label>
        <input class="input" name="manchete" id="manchete" type="text" required>
        
        <label class="label" for="res_mat">Resumo da Matéria:</label>
        <input class="input" name="res_mat" id="res_mat" type="text" required>

        <label for="imagem">Escolha uma imagem:</label>
        <input type="file" id="imagem" name="imagem" accept="image/*" required>
        
        <label for="text_mat">Texto da Matéria:</label>
        <textarea id="text_mat" name="text_mat" rows="5" cols="50" placeholder="Digite aqui..." required></textarea>

        <input id="btn" type="submit" value="Enviar">
    </form>
    
    <?php
        session_start();
        if (!isset($_SESSION['tipo_usuario']) || $_SESSION['tipo_usuario'] != 'escritor') {
            header('Location: index.php');
            exit;
        }
    ?>
</body>
</html>
