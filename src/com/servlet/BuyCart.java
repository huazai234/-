package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entiy.Product;
import com.entiy.Repository;
import com.entiy.ShopCart;

/**
 * Servlet implementation class BuyCart
 */
@WebServlet(name = "shop",urlPatterns = "/BuyCart")
public class BuyCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BuyCart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//		response.getWriter().append("Served at: ").append(request.getContextPath());		
		String addString=request.getParameter("add");
		String deleteString=request.getParameter("delete");
		//���
		if(addString!=null) {
			String Param=request.getParameter("add");
			Map productMap=Repository.getProducts();
			Product product=(Product)productMap.get(Integer.parseInt(Param));
			HttpSession session=request.getSession();
			//��һ������session������
			if(session.getAttribute("cart")==null) {
				ShopCart shopCart=new ShopCart<Product>();				
				product.setCartCount(1);
				List list=new ArrayList();
				list.add(product);
				shopCart.setList(list);
				request.setAttribute("msg", "�ɹ���Ӹ���Ʒ");
				session.setAttribute("cart",shopCart);
				request.getRequestDispatcher("/list.jsp").forward(request, response);;
			}else {
				//�ڶ�������session�Ѵ���
				ShopCart shopCart=(ShopCart<Product>)session.getAttribute("cart");
				//����ӵĲ�Ʒ����
				int id=product.getPid();
				List<Product> list=shopCart.getList();
				for(Product product2:list) {
					if(product2.getPid()==id) {
						product2.setCartCount(product2.getCartCount()+1);
						request.setAttribute("msg", "�ɹ���Ӹ���Ʒ��");
						request.getRequestDispatcher("/list.jsp").forward(request, response);;
						return;
					}
				}
				//
				product.setCartCount(1);
				shopCart.getList().add(product);
				request.setAttribute("msg", "�ɹ���Ӹ���Ʒ");
//				session.setAttribute("cart", shopCart);
				request.getRequestDispatcher("/list.jsp").forward(request, response);;
			}
			//ɾ��
		}else if(deleteString!=null) {
			String Param=request.getParameter("delete");
			HttpSession session=request.getSession();
			ShopCart<Product> shopCart=(ShopCart<Product>)session.getAttribute("cart");
			shopCart.getList().remove(Integer.parseInt(Param));
//			session.setAttribute("cart", shopCart);
			request.getRequestDispatcher("/cart.jsp").forward(request, response);;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
