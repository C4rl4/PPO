package dao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import classbeans.Conta;
import classbeans.DicionarioPronto;
import classbeans.Usuario;
import conection.BDconeccao;

public class DaoConta {
	
	private Connection connection = BDconeccao.getConnection();
	
	public DaoConta() {
		
	}
	
	public void AdicionarConta(Conta conta) {
		try {
			
		PreparedStatement criarconta= connection.prepareStatement("insert into conta(nome,arquivo,id_usuario) "
				+ "values(?,?,?)");
		
		criarconta.setString(1, conta.getNome());
		criarconta.setBinaryStream(2,  conta.getDocumento());
		criarconta.setInt(3, conta.getIdusuario());
		criarconta.executeUpdate();
		
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void UpdateConta(Conta cont) throws SQLException {
		Conta conta = new Conta();
		PreparedStatement sqlconta = connection.prepareStatement("update conta set nome=?, arquivo=?, id_usuario=? where id=? ");
		sqlconta.setString(1, cont.getNome());
		sqlconta.setBinaryStream(2, cont.getDocumento());
		sqlconta.setInt(3, cont.getIdusuario());
		sqlconta.setInt(4, cont.getId());
		sqlconta.executeUpdate();
	}
	public void DeleteConta(Conta conta) {
		
			try {
			PreparedStatement preparadelete = connection.prepareStatement("delete from conta where nome=? and id_usuario=?");
			preparadelete.setString(1, conta.getNome());
			preparadelete.setInt(2,conta.getIdusuario());
			preparadelete.executeUpdate();
			}
			catch (SQLException exc) {
				exc.printStackTrace();
			} 
		}
	public ArrayList<Conta> getallConta() throws SQLException, IOException{
		ArrayList<Conta> conta = new ArrayList<Conta>();
		Statement dic = null;
		ResultSet rs=null;
		FileOutputStream output = null;
		InputStream input = null;
		
		try {
			int increment=0;
			Conta usuario = new Conta();
			dic = connection.createStatement();
			 rs = dic.executeQuery("select nome, arquivo from conta ");
			while(rs.next()) {
			File file = new File("C:\\Users\\ncarl\\eclipse-workspace2\\ppo\\src\\main\\webapp\\img\\"+ rs.getString("nome")+  ".png");
			output = new FileOutputStream(file);
			Conta users=new Conta();
			users.setNome(rs.getString("nome"));
			input=rs.getBinaryStream("arquivo");
			System.out.println("lendo documento do banco de dados....");
			byte[] buffer = new byte[1024];
			while (input.read(buffer) > 0) {
				//escrevendo a imagem
				output.write(buffer);
			}
			users.setReceber(file);
			System.out.println("\nSaved to file: " + file.getAbsolutePath());
			conta.add(users);
			increment++;
			
			 }
			
		}catch (SQLException exc) {
			exc.printStackTrace();
		} 	
		
				return conta;
	}

public int idConta(int idusuario, String nome) throws SQLException {
	PreparedStatement dic =connection.prepareStatement("select id from conta where nome = ? and id_usuario=?");
	dic.setString(1, nome);
	dic.setInt(2,idusuario );
	System.out.println(nome);
	System.out.println(idusuario);
	ResultSet rs=dic.executeQuery();
	if(rs.next()) { 
	return rs.getInt("id");
	}
	return 0;
	
}	

}
