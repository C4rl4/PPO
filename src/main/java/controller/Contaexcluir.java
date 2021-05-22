package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classbeans.Conta;
import classbeans.Usuario;
import dao.DaoConta;
import dao.DaoUsuario;

/**
 * Servlet implementation class Contaexcluir
 */
@WebServlet
public class Contaexcluir extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Contaexcluir() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Conta conta = new Conta();
		DaoUsuario usuari = new DaoUsuario();
		Usuario usuario = new Usuario();
		DaoConta excluirtext=new DaoConta();
		String nome = request.getParameter("excluirtexto");
		try {
			int idusuario = usuari.getusuarionomeusuarioByName((String)request.getSession().getAttribute("usuario"));
			usuario.setId(idusuario);
			conta.setIdusuario(idusuario);
			conta.setNome(nome);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		excluirtext.DeleteConta(conta);
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
