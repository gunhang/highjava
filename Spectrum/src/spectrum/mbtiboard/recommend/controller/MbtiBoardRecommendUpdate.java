package spectrum.mbtiboard.recommend.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spectrum.mbtiboard.recommend.service.MbtiBoardRecommendService;
import spectrum.mbtiboard.recommend.vo.MbtiBoardRecommendVO;
import spectrum.mbtiboard.service.MbtiBoardService;
import spectrum.mbtiboard.vo.MbtiBoardVO;
@WebServlet("/mbtiboard/recommendupdate")
public class MbtiBoardRecommendUpdate extends HttpServlet{

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberId = req.getParameter("memberId");
        String mbtiBoardNum = req.getParameter("mbtiBoardNum");
		String yN=req.getParameter("yN");
		
		//  추천 수 증가 감소
		String recommend=MbtiBoardRecommendService.getInstance().getRecommend(mbtiBoardNum);
		int reNum = Integer.parseInt(recommend);
		if(yN.equals("Y")) {
					
			
			recommend = String.valueOf(reNum+1);
			
		}else if(yN.equals("N")) {
			recommend = String.valueOf(reNum-1);
		}
		MbtiBoardVO recommendMv =new MbtiBoardVO();
		recommendMv.setmbtiboardRecommendednumber(recommend);
		recommendMv.setmbtiboardPostnum(mbtiBoardNum);
		MbtiBoardRecommendService.getInstance().recommend(recommendMv);
		
		
		// yn 값 업데이트
		MbtiBoardRecommendVO mrv = new MbtiBoardRecommendVO();
		mrv.setRecommendationRecommendyn(yN);
		mrv.setMemberId(memberId);
		mrv.setMbtiboardPostnum(mbtiBoardNum);
		MbtiBoardRecommendService.getInstance().recommendupdate(mrv);
		
		
		//디테일 출력
		MbtiBoardVO mv = null;
		mv = MbtiBoardService.getInstance().mbtiBoardDetail(mbtiBoardNum);
		req.setAttribute("mv", mv);
		
		
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/mbtiboard/mbtiboarddetail.jsp");
		dispatcher.forward(req, resp);
	
	
	}
	
	
	
}
