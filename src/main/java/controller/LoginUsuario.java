package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classbeans.Usuario;
import dao.DaoUsuario;

@WebServlet(name="LoginUsuario", urlPatterns= {"/login"})
public class LoginUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LOGIN_OUVINTE ="principalouvinte.jsp";
	private static String LOGIN_INTERPRETE="principalinterprete.jsp";
	private static String LOGIN_SURDO="principalsurdo.jsp";
    private DaoUsuario  dao= null;
    
   public LoginUsuario() {
	   dao= new DaoUsuario();
   }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter print = response.getWriter();
		Usuario usuario = new Usuario();
		String nome = request.getParameter("nome");
		System.out.println(nome);
		String senha = request.getParameter("senha");
		usuario=dao.getLogin(nome, senha);
		if(usuario.getNome()!=null && usuario.getSenha()!=null && !usuario.getNome().isEmpty() && !usuario.getSenha().isEmpty()) {
			HttpSession session =request.getSession();
			session.setAttribute("usuario", nome);
			if(usuario.getTipo().equals("ouvinte")) {
				response.sendRedirect("principalouvinte.jsp");
			}else if(usuario.getTipo().equals("surdo")) {
				
				response.sendRedirect("principalsurdo.jsp");
			}else if(usuario.getTipo().equals("interprete")) {
				
				response.sendRedirect("principalinterprete.jsp");
			}else {
				response.sendRedirect("Login.jsp");
			}
		}else {
			response.sendRedirect("Error.html");
		}
	}

}
