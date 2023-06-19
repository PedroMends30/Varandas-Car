package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import model.Usuario;
import util.Conexao;

public class UsuarioDao {
	public boolean inserirUsuario(Usuario p) {
		Conexao con = null;
		
		try {
			con = new Conexao();
			con.executeUpdate("INSERT INTO `usuarios` "
					+ "(`nome_usuario`, `email_usuario`,"
					+ " `telefone_usuario`, `senha_usuario`)"
					+ " VALUES ('"+p.getNome_usuario()+"', '"+p.getEmail_usuario()+"',"
							+ " '"+p.getTelefone_usuario()+"', '"+p.getSenha_usuario()+"');");
			return true;
		}catch(SQLException e){
			return false;
		}
		
	}
	public ResultSet retornaUsuarios() {
		Conexao con = null;
		try {
			con = new Conexao();
			ResultSet resultados = con.executeQuery("SELECT * FROM `usuarios`");
			return resultados;
		}catch(SQLException e){
			ResultSet vazio = null;
			return vazio;
		}
	}
	
	public Usuario retornaUsuario(int index) {
		Conexao con = null;
		try {
			con = new Conexao();
			ResultSet resQuery = con.executeQuery("SELECT * FROM `usuarios` WHERE id_usuario = "+Integer.toString(index));
			resQuery.next();
			
			Usuario p = new Usuario();
			p.setId_usuario(resQuery.getInt(1));
			p.setNome_usuario(resQuery.getString(2));
			p.setEmail_usuario(resQuery.getString(3));
			p.setTelefone_usuario(resQuery.getString(4));
			p.setSenha_usuario(resQuery.getString(5));
			
			return p;
			
		}catch(SQLException e){
			Usuario vazio = null;
			return vazio;
		}
	}
	
	public boolean login(String email, String senha) {
		Conexao con = null;
		int qnt = 0;
		try {
			con = new Conexao();
			ResultSet login = con.executeQuery("SELECT * FROM `usuarios` WHERE email_usuario LIKE '"+ email +"' AND senha_usuario LIKE '"+senha+"';");
			
			while(login.next()) {
				qnt++;
			}
			
			if (qnt == 0 || qnt > 1) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}
	
	
	public int UserByLogin(String email, String senha) {
		Conexao con = null;
		int qnt = 0;
		try {
			con = new Conexao();
			int id_user = 0;
			ResultSet login = con.executeQuery("SELECT * FROM `usuarios` WHERE email_usuario LIKE '"+ email +"' AND senha_usuario LIKE '"+senha+"';");
			
			while(login.next()) {
				qnt++;
				id_user = login.getInt(1);
			}
			
			 
			
			if (qnt == 0 || qnt > 1) {
				return -2;
			} else {
				return id_user;
			}
		} catch (Exception e) {
			return -1;
		}
	}
	
	
	public boolean apagaUsuario(int id) {
		Conexao con = null;
		try {
			con = new Conexao();
			con.executeUpdate("DELETE FROM `usuarios` WHERE id_usuario = "+id);
			return true;
		}catch(Exception e){
			return false;
		}
	}
	
	public boolean verificaCampo(String field, String value){
		Conexao con = null;
		int lines = 0;
		try {
			con = new Conexao();
			ResultSet res = con.executeQuery("SELECT * FROM `usuarios` WHERE `"+field+"` LIKE \""+value+"\";");
			while(res.next()) {
				lines++;
			}
			System.out.println(lines);
		} catch (SQLException e) {
			System.out.println("Erro SQL "+e);
		}
		
		if(lines == 0) {
			return false;
		}else {
			return true;
		}
	}
}