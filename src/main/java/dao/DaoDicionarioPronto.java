package dao;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
	public void AdicionarDicionarioPronto(DicionarioPronto criardicionario) {
		try {
			
		PreparedStatement criardicionario1= connection.prepareStatement("insert into dicionario_pronto(nome,imagem,categoria,id_conta) "
				+ "values(?,?,?,?)");
		
		criardicionario1.setString(1, criardicionario.getNome());
		criardicionario1.setBinaryStream(2,  criardicionario.getImg());
		criardicionario1.setString(3, criardicionario.getCategoria());
		criardicionario1.setInt(4,  criardicionario.getIdconta());
		System.out.println("ok,"+criardicionario.getIdconta());
		criardicionario1.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public void deleteDicionarioPronto(int idconta) {
		try {
	PreparedStatement preparedStatement = connection.prepareStatement("delete from dicionario_pronto where id_conta=?");
		preparedStatement.setInt(1, idconta);
		preparedStatement.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	public ArrayList<DicionarioPronto> getallDicionario() throws SQLException, IOException{
		ArrayList<DicionarioPronto> dicionario = new ArrayList<DicionarioPronto>();
		Statement dic = null;
		ResultSet rs=null;
		FileOutputStream output = null;
		InputStream input = null;
		
		try {
			int increment=0;
			 dic = connection.createStatement();
			 rs = dic.executeQuery("select nome, imagem, categoria from dicionario_pronto ");
			while(rs.next()) {
				File file = new File("C:\\Users\\ncarl\\eclipse-workspace2\\ppo\\src\\main\\webapp\\img\\"+ rs.getString("nome")+ increment+ ".png");
				output = new FileOutputStream(file);
				DicionarioPronto usuario = new DicionarioPronto();
				usuario.setNome(rs.getString("nome")); 
				usuario.setCategoria(rs.getString("categoria"));
				input=rs.getBinaryStream("imagem");
				
				System.out.println("lendo documento do banco de dados....");
				byte[] buffer = new byte[760];
				while (input.read(buffer) > 0) {
					//escrevendo a imagem
					output.write(buffer);
				}
				usuario.setReceber(file);
				System.out.println("\nSaved to file: " + file.getAbsolutePath());
				dicionario.add(usuario);
				increment++;
			}
			
		}catch (SQLException exc) {
			exc.printStackTrace();
		} 	
		
				return dicionario;
	}
	public void updateConta(DicionarioPronto dici) {
		try {
			PreparedStatement criardicionario= connection.prepareStatement("update dicionario_pronto set nome=?,imagem=?,categoria=? where id_conta=?" );
			
			criardicionario.setString(1, dici.getNome());
			
			criardicionario.setBinaryStream(2, dici.getImg());
			criardicionario.setString(3,dici.getCategoria());
			criardicionario.setInt(4, dici.getIdconta());
			criardicionario.executeUpdate();
			
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
				usuario.setCategoria(rs.getString("categoria"));
				usuario.setImg(rs.getBinaryStream("imagem"));
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
