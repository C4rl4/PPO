package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import classbeans.Conta;
import classbeans.DicionarioPronto;
import classbeans.Usuario;
import conection.BDconeccao;

public class DaoDicionarioPronto {

	
	private Connection connection = BDconeccao.getConnection();
	
	public DaoDicionarioPronto() {
	}
	public void AdicionarDicionarioPronto(Conta conta) {
		try {
			Random random = new Random();
			int id= random.nextInt(50);
		PreparedStatement criardicionario= connection.prepareStatement("insert into dicionario_pronto(id,nome,imagem,id_conta) "
				+ "values(?,?,?,?)");
		criardicionario.setInt(0, id);
		criardicionario.setString(2, conta.getNome());
		criardicionario.setString(3, conta.getDocumento());
		criardicionario.setInt(4, conta.getId());
		
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public void deleteDicionarioPronto(int idconta) {
		try {
	PreparedStatement preparedStatement = connection.prepareStatement("delete from dicionario_pronto where usuario_id=?");
		preparedStatement.setInt(1, idconta);
		preparedStatement.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	public List<DicionarioPronto> getallDicionario(){
		List<DicionarioPronto> dicionario = new ArrayList<DicionarioPronto>();
		try {
			Statement dic = connection.createStatement();
			ResultSet rs = dic.executeQuery("select nome and imagem from dicionario_pronto ");
			while(rs.next()) {
				DicionarioPronto usuario = new DicionarioPronto();
				
				usuario.setNome(rs.getString("nome"));
				usuario.setImg(rs.getString("imagem"));
				dicionario.add(usuario);
			}
		}catch (SQLException exc) {
			exc.printStackTrace();
		} 
		return dicionario;
	}
	public void updateConta(Conta conta) {
		try {
			PreparedStatement criardicionario= connection.prepareStatement("update dicionario_pronto set nome=?,imagem=? where id_conta=?" );
			
			criardicionario.setString(1, conta.getNome());
			criardicionario.setString(2, conta.getDocumento());
			criardicionario.setInt(3, conta.getId());
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public DicionarioPronto getDicionarioProntoById(int contaid) {
		DicionarioPronto usuario = new DicionarioPronto();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("select * from dicionario_pronto where id_conta=?");
			preparedStatement.setInt(1, contaid);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setImg(rs.getString("imagem"));
				usuario.setIdconta(rs.getInt("id_conta"));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return usuario;
	}
	public DicionarioPronto getContaadmin() {
		
		DicionarioPronto usuario = new DicionarioPronto();
		usuario=getDicionarioProntoById(1);
		return usuario;
	}
	
}
