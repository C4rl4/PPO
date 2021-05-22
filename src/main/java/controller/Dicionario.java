package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import classbeans.Conta;
import classbeans.DicionarioPronto;
import classbeans.Usuario;
import dao.DaoConta;
import dao.DaoDicionarioPronto;
import dao.DaoUsuario;
import sun.misc.BASE64Decoder;

@WebServlet(name="Dicionario")
@MultipartConfig
public class Dicionario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       DaoDicionarioPronto dici ;
       
    public Dicionario() {
        super();
        dici= new DaoDicionarioPronto();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		File someFile = new File("img.png");
		FileOutputStream fos = new FileOutputStream(someFile);
		String fileupload = request.getParameter("fileUpload");
		String base64Image = fileupload.split(",")[1];
		BASE64Decoder decoder = new BASE64Decoder();
		byte[] imageByte=decoder.decodeBuffer(base64Image);
		System.out.println(fileupload);
		fos.write(imageByte);
		fos.flush();
		fos.close();
		FileInputStream stream= new FileInputStream(someFile);
		System.out.println(fileupload);
		DaoUsuario usuari = new DaoUsuario();
		Usuario usuario = new Usuario();
		DaoConta contausuario = new DaoConta();
		Conta contausuari= new Conta();
		DaoDicionarioPronto dicioadd = new DaoDicionarioPronto();
		DicionarioPronto dicionario = new DicionarioPronto();
		dicionario.setNome(request.getParameter("nome"));
		String nomeconta =request.getParameter("nome");
		dicionario.setCategoria(request.getParameter("descricao"));
		dicionario.setImg(stream);
		try {
			int idusuario = usuari.getusuarionomeusuarioByName((String)request.getSession().getAttribute("usuario"));
			usuario.setId(idusuario);
			System.out.println(idusuario);
			contausuari.setIdusuario(idusuario);
			System.out.println();
			System.out.println(nomeconta);
			int idconta=contausuario.idConta(idusuario,nomeconta);
			dicionario.setIdconta(idconta);
			System.out.println(idconta);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dicioadd.AdicionarDicionarioPronto(dicionario);
		
	}
	
	}


