<%@page language="java" import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//Recupera informações do usuário
    String nome 	= request.getParameter("reg_nome") + " " + request.getParameter("reg_snome");
    String sexo 	= request.getParameter("reg_sexo");
    String data 	= request.getParameter("reg_data");
    String cpf 		= request.getParameter("reg_cpf");
    String endereco = request.getParameter("reg_rua") + "-" + request.getParameter("reg_cidade") + "-" + 
                        request.getParameter("reg_estado") + "-" + request.getParameter("reg_cep");
    String email 	= request.getParameter("reg_email");
    String telefone = request.getParameter("reg_fone");
    String senha 	= request.getParameter("reg_password");
    String tipo 	= request.getParameter("radio");

    //Informações de acesso ao banco
    String db   	= "dbouber";
	String user 	= "root";
	String password	= "";
	String url     	= "jdbc:mysql://localhost:3306/" + db;
	String driver  	= "com.mysql.jdbc.Driver";

	//String de inserção no banco de dados
	String insert 	= "INSERT INTO usuario(CPF, NOME, SEXO, ENDERECO, EMAIL, TELEFONE, SENHA, DATA_NASCIMENTO, MOTORISTA) VALUES ('" + cpf + "', '" + nome + "', '" + sexo + "', '" + endereco + "', '" + email + "', '" + telefone + "', '" + senha + "', '" + data + "', 0)";

	//Carregar o driver do mysql
	Class.forName(driver);

	//Abrir conexão com o banco
	Connection _conexão;
	_conexão = DriverManager.getConnection(url, user, password);
	Statement stm = _conexão.createStatement();

	//Executa a inserção dos dados no banco
	try {
		stm.executeUpdate(insert);
	} catch(Exception ex) {
		out.println(ex);
	} finally {
		_conexão.close();
		stm.close();
	}

	//Rediceriona para a página de login
	response.sendRedirect("../login.html");

%>