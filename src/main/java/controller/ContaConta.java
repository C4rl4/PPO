package controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Scanner;
import sun.misc.BASE64Decoder;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.FileUtils;

import classbeans.Conta;
import classbeans.Usuario;
import dao.DaoConta;
import dao.DaoDicionarioPronto;
import dao.DaoUsuario;
import io.netty.handler.codec.base64.Base64Decoder;

/**
 * criar conta : receber dados do usuario para criar a conta
 */
@WebServlet(name="ContaConta", urlPatterns= {"/ContaConta"})
@MultipartConfig
public class ContaConta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 DaoConta dici ;
    public ContaConta() {
        super();
        dici= new  DaoConta();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		contausuari.setDocumento(stream);
		contausuari.setNome(request.getParameter("nome"));
		System.out.println(request.getParameter("nome"));
		System.out.println(stream);
		try {
			int idusuario = usuari.getusuarionomeusuarioByName((String)request.getSession().getAttribute("usuario"));
			usuario.setId(idusuario);
			contausuari.setIdusuario(idusuario);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		contausuario.AdicionarConta(contausuari);
		try {
			String tipo=usuari.getusuarionomeusuarioByTipo(usuario.getId());
			if(tipo.equals("interprete")) {
				response.sendRedirect("principalinterprete.jsp");
				
			}
			else if(tipo.equals("surdo")) {
				response.sendRedirect("principalsurdo.jsp");
				
			}
			else {
				response.sendRedirect("principalouvinte.jsp");
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
