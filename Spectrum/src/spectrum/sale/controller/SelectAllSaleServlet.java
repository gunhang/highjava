package spectrum.sale.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import spectrum.board.service.INoticBoardService;
import spectrum.board.service.NoticeBoardSeriveImpl;
import spectrum.board.vo.NoticeBoardVO;
import spectrum.sale.service.ISaleService;
import spectrum.sale.service.SaleServiceImpl;
import spectrum.sale.vo.SaleVO;

@WebServlet("/sale/salelist.do")
public class SelectAllSaleServlet extends HttpServlet {
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			// 1. 서비스 객체 생성하기
			ISaleService saleService = SaleServiceImpl.getInstance();
			
			// 2. 회원정보 조회
			List<SaleVO> saleList = saleService.getALLSaleList();
			
			
			
			int saleSize = saleList.size();
			if(saleSize > 0) {
				for(int i=0; i < saleSize; i++){
			
				int total =0;
				 total += Integer.parseInt(saleList.get(i).getPaymentAmount());
				// System.out.println(total);
				}
			}
			
			
			
			
			
			req.setAttribute("saleList", saleList);
			
			
			
			
			RequestDispatcher dispatcher = 
					req.getRequestDispatcher("/WEB-INF/views/sale/salelist.jsp");
			dispatcher.forward(req, resp); // 뷰페이지로 전달
			
	
		}
		
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doGet(req, resp);
		}
}
