package dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
				connection.prepareStatement("insert into usuario(nome,nascimento,sexo,tipo,documento,email,senha ) values(?,?,?,?,?,?,?)");
		
		
		preparastmt.setString(1, usuario.getNome());
		System.out.println(usuario.getNascimento());
		preparastmt.setDate(2, new java.sql.Date(usuario.getNascimento().getTime()));
		preparastmt.setString(3,usuario.getSexo());
		preparastmt.setString(4, usuario.getTipo());
		preparastmt.setBinaryStream(5, usuario.getDocumento());
		preparastmt.setString(6, usuario.getEmail());
		preparastmt.setString(7, usuario.getSenha());
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
			preparaupdate.setString(3, usuario.getSexo());
			preparaupdate.setString(4, usuario.getTipo());
			preparaupdate.setBinaryStream(5, usuario.getDocumento());
			preparaupdate.setString(6, usuario.getEmail());
			preparaupdate.setString(7, usuario.getSenha());
			preparaupdate.setInt(8, usuario.getId());
			preparaupdate.executeUpdate();
			
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
	public Usuario getUsuarioByid(int usuarioid) throws IOException, SQLException {
		Usuario usuario = new Usuario();
		
		PreparedStatement busca=connection.prepareStatement("select * from usuario where id = ?");
		busca.setInt(1, usuarioid);
		ResultSet rs = busca.executeQuery();
		
		if(rs.next()) {
			usuario.setNome(rs.getString("nome"));
			usuario.setId(rs.getInt("id"));
			usuario.setTipo(rs.getString("tipo"));
		}
		return usuario;
		
		
			
	}
	public Usuario getLogin(String nome, String senha) throws IOException {
		Usuario usuario = new Usuario();
		System.out.println(nome);
		try {
			
			PreparedStatement busca =connection.prepareStatement("select * from usuario where nome = ? and senha=?");
			busca.setString(1, nome);
			
		busca.setString(2, senha);
		ResultSet rs = busca.executeQuery();
		
		if(rs.next()) {
			
			
			usuario.setNome(rs.getString("nome"));
			usuario.setTipo(rs.getString("tipo"));
			
			usuario.setEmail(rs.getString("email"));
			usuario.setSenha(rs.getString("senha"));
		}
		
		}catch (SQLException exc) {
			exc.printStackTrace();
		} 
		
		System.out.println(usuario.getNome());
		System.out.println(usuario.getSenha());
		System.out.println(usuario.getEmail());
		System.out.println(usuario.getTipo());
		return usuario;
	}
	public Integer getusuarionomeusuarioByName(String nomeusuario) throws SQLException {
		PreparedStatement dic =connection.prepareStatement("select id from usuario where nome = ?");
		dic.setString(1, nomeusuario);
		System.out.println(nomeusuario);
		ResultSet rs=dic.executeQuery();
		if(rs.next()) { 
		return rs.getInt("id");
		}
		return 0;
		
	}
	public String getusuarionomeusuarioByTipo(int idusuario) throws SQLException {
		PreparedStatement dic =connection.prepareStatement("select tipo from usuario where id = ?");
		String tipo = null;
		dic.setInt(1, idusuario);
		System.out.println(idusuario);
		ResultSet rs=dic.executeQuery();
		if(rs.next()) { 
		 tipo=rs.getString("tipo");
		}
		return tipo;
		
	}
	
		
		
	}

	

