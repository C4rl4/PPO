package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.taglibs.standard.extra.spath.ParseException;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import classbeans.Conta;
import classbeans.DicionarioPronto;
import classbeans.Usuario;
import dao.DaoConta;
import dao.DaoDicionarioPronto;
import dao.DaoUsuario;


@WebServlet(name="UsuarioControle", urlPatterns= {"/usuariocontrole"})
@MultipartConfig
public class UsuarioControle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LOGIN ="/Login.jsp";
	private static String Dicionario="/Dicionario.jsp";
    private DaoUsuario dao = null;
   
    
    public UsuarioControle() {
        super();
        dao= new DaoUsuario();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario usuario = new Usuario();
		Conta cont = new Conta();
		DicionarioPronto dicip = new DicionarioPronto();
		usuario.setNome(request.getParameter("nome"));
		try {
			Date nascimento=null;
			String teste= request.getParameter("data");
			
			if(request.getParameter("data")!=null) {
				nascimento = new SimpleDateFormat("dd-MM-yyyy").parse(request.getParameter("data"));
			}else {
				nascimento=null;
			}
			usuario.setNascimento(nascimento);
		}catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		usuario.setEmail(request.getParameter("email"));
		usuario.setSexo(request.getParameter("sexo"));
		usuario.setTipo(request.getParameter("tipo"));
		usuario.setDocumentorecebe(request.getParameter("fimage"));
		String senha1 = request.getParameter("senhaForca");
		String senha2 = request.getParameter("senhaForca2");
		if(senha1.equals(senha2)) {
			usuario.setSenha(senha1);
		}else {
			
		}
		try {
			dao.AdicionarUsuario(usuario);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
		RequestDispatcher view = request.getRequestDispatcher(LOGIN);
		view.forward(request, response);
	}

}
