<?php
session_start(); // Iniciar a sessão

// Dados do formulário (sanitize)
$login = isset($_POST['user']) ? trim($_POST['user']) : ''; // Evitar dados nulos ou não definidos
$senha = isset($_POST['senha']) ? trim($_POST['senha']) : ''; // Mesma coisa para a senha

// Verificar se os dados foram fornecidos
if (empty($login) || empty($senha)) {
    header("Location: login.php?erro=campos");
    exit;
}

// Conexão com o banco
$host = "localhost:3306";
$user = "root";
$pass = "";
$base = "jornal";

$conexao = new mysqli($host, $user, $pass, $base);

// Verificando erros na conexão
if ($conexao->connect_error) {
    die("Erro na conexão com o banco de dados: " . $conexao->connect_error);
}

// Proteção contra SQL Injection (uso de prepared statements)
$sql = "SELECT * FROM login WHERE email = ?";
$stmt = $conexao->prepare($sql);
$stmt->bind_param("s", $login); // "s" para string (email)
$stmt->execute();
$resultado = $stmt->get_result();

// Verificando se o usuário existe e a senha está correta
if ($resultado->num_rows > 0) {
    $usuario = $resultado->fetch_assoc();
    // Verificando a senha com o hash
    if (password_verify($senha, $usuario['senha'])) {
        // Sessão para o usuário logado
        $_SESSION['usuario'] = $usuario['email'];
        $_SESSION['tipo_usuario'] = $usuario['tipo']; 

        // Redirecionando com base no tipo de usuário
        if ($_SESSION['tipo_usuario'] == 'leitor') {
            header("Location: leitor.php"); 
        } elseif ($_SESSION['tipo_usuario'] == 'escritor') {
            header("Location: escritor.php"); 
        } elseif ($_SESSION['tipo_usuario'] == 'administrador') {
            header("Location: administrador.php"); 
        }
        exit;
    } else {
        // Erro na senha
        header("Location: login.php?erro=senha");
        exit;
    }
} else {
    // Erro no usuário (não encontrado)
    header("Location: login.php?erro=usuario");
    exit;
}

$stmt->close();
$conexao->close();
?>