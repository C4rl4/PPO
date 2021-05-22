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
import classbeans.DicionarioSimbolo;
import conection.BDconeccao;

public class DaoDicionarioSimbolo {
	private Connection connection = BDconeccao.getConnection();
public DaoDicionarioSimbolo() {
		
	}

public void AdicionarDicionarioSimbolo(DicionarioSimbolo dicisim) throws SQLException {
	
	PreparedStatement addsim = connection.prepareStatement("insert into dicionario_simbolos (nome, imagem, id_conta) values(?,?,?)");
	addsim.setString(1, dicisim.getNome());
	addsim.setBinaryStream(2,dicisim.getImg());
	addsim.setInt(3,dicisim.getIddicsimb());
	addsim.executeUpdate();
}
public void UpdateDaoSimbolo(DicionarioSimbolo dicisim) throws SQLException {
	
	PreparedStatement sqlsimb = connection.prepareStatement("update dicionario_simbolos set nome=?, imagem=? where id=? ");
	sqlsimb.setString(1,dicisim.getNome());
	sqlsimb.setBinaryStream(2,dicisim.getImg());
	sqlsimb.setInt(3,dicisim.getId());
	sqlsimb.executeUpdate();
}
public ArrayList<DicionarioSimbolo> getallDicionario() throws SQLException, IOException{
	ArrayList<DicionarioSimbolo> dicionario = new ArrayList<DicionarioSimbolo>();
	Statement dic = null;
	ResultSet rs=null;
	FileOutputStream output = null;
	InputStream input = null;
	
	try {
		int increment=0;
		 dic = connection.createStatement();
		 rs = dic.executeQuery("select nome, imagem from dicionario_simbolos ");
		while(rs.next()) {
			File file = new File("C:\\Users\\ncarl\\eclipse-workspace2\\SignwritingPpO\\src\\main\\webapp\\img\\"+ rs.getString("nome")+ increment+ ".png");
			output = new FileOutputStream(file);
			DicionarioSimbolo simb = new DicionarioSimbolo();
			simb.setNome(rs.getString("nome")); 
			
			input=rs.getBinaryStream("imagem");
			
			System.out.println("lendo documento do banco de dados....");
			byte[] buffer = new byte[760];
			while (input.read(buffer) > 0) {
				//escrevendo a imagem
				output.write(buffer);
			}
			simb.setImgrecebe(file);
			System.out.println("\nSaved to file: " + file.getAbsolutePath());
			dicionario.add(simb);
			increment++;
		}
		
	}catch (SQLException exc) {
		exc.printStackTrace();
	} 	
	
			return dicionario;
}
public void deleteDicionarioSimbolo(DicionarioSimbolo simbi) {
	try {
PreparedStatement preparedStatement = connection.prepareStatement("delete from dicionario_simbolos where nome=?");
	preparedStatement.setString(1, simbi.getNome());
	preparedStatement.executeUpdate();
	}catch(SQLException e) {
		e.printStackTrace();
	}
	
}
	

}
