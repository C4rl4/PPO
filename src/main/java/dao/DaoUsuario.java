package dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import classbeans.Usuario;
import conection.BDconeccao;

public class DaoUsuario {
	
	
	private Connection connection = null;
	public DaoUsuario() {
		connection = BDconeccao.getConnection();
	}
	
	public void AdicionarUsuario(Usuario usuario) throws SQLException {
		
		try {
		PreparedStatement preparastmt = 
				connection.prepareStatement("insert into usuario(id,nome,nascimento,sexo,tipo,documento,email,senha ) values(?,?,?,?,?,?,?,?)");
		
		preparastmt.setInt(1, usuario.getId());
		preparastmt.setString(2, usuario.getNome());
		System.out.println(usuario.getNascimento());
		preparastmt.setDate(3, new java.sql.Date(usuario.getNascimento().getTime()));
		preparastmt.setString(4,usuario.getSexo());
		preparastmt.setString(5, usuario.getTipo());
		preparastmt.setString(6,usuario.getDocumento());
		preparastmt.setString(7, usuario.getEmail());
		preparastmt.setString(8, usuario.getSenha());
		preparastmt.executeUpdate();
		
		}catch (SQLException exc) {
			exc.printStackTrace();
		} 
	}
	
	public void DeleteUsuario(int usuarioid) {
		try {
		PreparedStatement preparadelete = connection.prepareStatement("delete from usuario where id=?");
		preparadelete.setInt(1, usuarioid);
		preparadelete.executeUpdate();
		}
		catch (SQLException exc) {
			exc.printStackTrace();
		} 
	}
	public void UpdateUsuario(Usuario usuario) {
		try {
			PreparedStatement preparaupdate = 
					connection.prepareStatement("update usuario set nome=?, nascimento=?, sexo=?, tipo=?, documento=?, email=?, senha=?" 
			+ "where id=?");
			preparaupdate.setString(1, usuario.getNome());
			preparaupdate.setDate(2,new java.sql.Date(usuario.getNascimento().getTime()));
			preparaupdate.setString(3,usuario.getSexo());
			preparaupdate.setString(4, usuario.getTipo());
			preparaupdate.setString(5,usuario.getDocumento());
			preparaupdate.setString(6, usuario.getEmail());
			preparaupdate.setString(7, usuario.getSenha());
			preparaupdate.setInt(8, usuario.getId());
			
		}catch (SQLException exc) {
			exc.printStackTrace();
		} 
	}
	public List<Usuario> getallUsuarios(){
		List<Usuario> listausuario = new ArrayList<Usuario>();
		try {
			Statement lista = connection.createStatement();
			ResultSet rs = lista.executeQuery("select * from usuario");
			while(rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setNascimento(rs.getDate("nascimento"));
				usuario.setSexo(rs.getString("sexo"));
				usuario.setTipo(rs.getString("tipo"));
				usuario.setEmail(rs.getString("email"));
				usuario.setSenha(rs.getString("senha"));
				listausuario.add(usuario);
			}
		}catch (SQLException exc) {
			exc.printStackTrace();
		} 
		return listausuario;
	}
	public Usuario getUsuarioByid(int usuarioid) {
		Usuario usuario = new Usuario();
		try {
			PreparedStatement buscausuario = 
					connection.prepareStatement("select * from usuario where id=?");
			buscausuario.setInt(1, usuarioid);
			ResultSet rs = buscausuario.executeQuery();
			if(rs.next()) {
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setNascimento(rs.getDate("nascimento"));
				usuario.setSexo(rs.getString("sexo"));
				usuario.setTipo(rs.getString("tipo"));
				usuario.setDocumento(rs.getString("documento"));
				usuario.setEmail(rs.getString("email"));
				usuario.setSenha(rs.getString("senha"));
			}
		}catch (SQLException exc) {
			exc.printStackTrace();
		} 
		return usuario;
	}
	public Usuario getLogin(String nome, String senha) {
		Usuario usuario = new Usuario();
		try {
		PreparedStatement buscausuario = 
				connection.prepareStatement("select * from usuario where nome=? and senha=? ");
		buscausuario.setString(1, nome);
		buscausuario.setString(2, senha);
		ResultSet rs = buscausuario.executeQuery();
		if(rs.next()) {
			usuario.setId(rs.getInt("id"));
			usuario.setNome(rs.getString("nome"));
			usuario.setNascimento(rs.getDate("nascimento"));
			usuario.setSexo(rs.getString("sexo"));
			usuario.setTipo(rs.getString("tipo"));
			usuario.setDocumento(rs.getString("documento"));
			usuario.setEmail(rs.getString("email"));
			usuario.setSenha(rs.getString("senha"));
		}
		
		}catch (SQLException exc) {
			exc.printStackTrace();
		} 
		return usuario;
	}

	

}