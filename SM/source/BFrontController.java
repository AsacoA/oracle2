package com.javalec.ex.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.command.LCommand;
import com.javalec.ex.command.LMListCommand;
import com.javalec.ex.command.LMRegisterCommand;
import com.javalec.ex.command.LRegisterCommand;
import com.javalec.ex.command.LReturnTheBookCommand;
import com.javalec.ex.command.LSearchCommand;
import com.javalec.ex.command.LStatusCommand;

/**
 * Servlet implementation class BFrontController
 */
@WebServlet("*.do")
public class BFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("33331234actionDo!!!!!");		
		request.setCharacterEncoding("utf-8");
		
		String viewPage = null;
		LCommand command = null;
		
		String uri = request.getRequestURI();	
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		if(com.equals("/bRegView.do")){ /*   �������   */
			System.out.println("bRegView");
			viewPage = "bRegView.jsp";	
		}else if(com.equals("/bReg.do")){
			System.out.println("bReg");
			command = new LRegisterCommand();
			command.execute(request, response);
			viewPage = "bRegView.jsp";	
		}else if(com.equals("/mRegView.do")){/*   ȸ�����   */
			System.out.println("mRegView");
			viewPage = "mRegView.jsp";	
		}else if(com.equals("/mReg.do")){
			System.out.println("mReg");
			command = new LMRegisterCommand();
			command.execute(request, response);
			viewPage = "mRegView.jsp";	
		}else if(com.equals("/statView.do")){/*  �� �� */
			System.out.println("statView");
			viewPage = "statView.jsp";	
		}else if(com.equals("/mListView.do")){/*   ȸ����Ȳ */
			System.out.println("mListView");
			command = new LMListCommand();
			command.execute(request, response);
			viewPage = "mListView.jsp";	
		}else if(com.equals("/bStatusView.do")){/*   ������Ȳ  �⺻ ����*/
			System.out.println("bStatusView");
			command = new LStatusCommand(0);
			command.execute(request, response);
			viewPage = "bStatusView.jsp";	
		}else if(com.equals("/bStatusViewB.do")){/*   ������Ȳ  ���� by book*/
			System.out.println("bStatusView");
			command = new LStatusCommand(1);
			command.execute(request, response);
			viewPage = "bStatusView.jsp";	
		}else if(com.equals("/bStatusViewR.do")){/*   ������Ȳ  ���� by �뿩����*/
			System.out.println("bStatusView");
			command = new LStatusCommand(2);
			command.execute(request, response);
			viewPage = "bStatusView.jsp";	
		}else if(com.equals("/bSearch.do")){/*   �����˻� */
			System.out.println("bStatusView & bSearch");
			command = new LSearchCommand();
			command.execute(request, response);
			viewPage = "bStatusView.jsp";		
		}else if(com.equals("/returnTheBook.do")){/*   ������ȯ */
			System.out.println("returnTheBook!!");
			command = new LReturnTheBookCommand();
			command.execute(request, response);
			command = new LStatusCommand(0);
			command.execute(request, response);
			
			viewPage = "bStatusView.jsp";	
		}else if(com.equals("/rentTheBook.do")){/*   ������ȯ */
			System.out.println("rentTheBook!!");
			command = new LReturnTheBookCommand();
			command.execute(request, response);
			command = new LStatusCommand(0);
			command.execute(request, response);
			
			viewPage = "bStatusView.jsp";	
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);	
	}


}
