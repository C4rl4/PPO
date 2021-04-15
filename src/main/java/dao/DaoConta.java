package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import classbeans.Conta;
import classbeans.Usuario;
import conection.BDconeccao;

public class DaoConta {
	
	private Connection connection = BDconeccao.getConnection();
	
	public DaoConta(){
		
	}
	
	public void AdicionarConta(Usuario usuario) {
		try {
			Random random = new Random();
			int id= random.nextInt(50);
		
		PreparedStatement criarconta = connection.prepareStatement("insert into conta(id,nome,arquivo,id_usuario) values(?,?,?,?)" );
			criarconta.setInt(1,id);
			criarconta.setString(2, usuario.getNome());
			criarconta.setString(3,null);
			criarconta.setInt(4,usuario.getId());
			criarconta.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public void deleteConta(int usuarioid) {
		try {
	PreparedStatement preparedStatement = connection.prepareStatement("delete from conta where usuario_id=?");
		preparedStatement.setInt(1, usuarioid);
		preparedStatement.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	public void updateConta(Usuario usuario) {
		try {
			PreparedStatement criarconta = connection.prepareStatement(" update conta set nome=?,documento=?" 
					+ "where id_usuario=?" );
			criarconta.setString(1,usuario.getNome());
			criarconta.setString(2, usuario.getDocumento());
			criarconta.setInt(3, usuario.getId());
			criarconta.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public Conta getContaById(int usuarioid) {
		Conta usuario = new Conta();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("select * from conta where id_usuario=?");
			preparedStatement.setInt(1, usuarioid);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setDocumento(rs.getString("arquivo"));
				usuario.setIdusuario(rs.getInt("id_usuario"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return usuario;
	}
}
