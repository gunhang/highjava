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

@WebServlet("/mbtiboard/recommendinsert")
public class MbtiBoardRecommendInsert extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberId=req.getParameter("memberId");
		String mbtiBoardNum = req.getParameter("mbtiBoardNum");
		
		// mbtiboard게시글 추천 갯수 구하고 저장
		String recommend=MbtiBoardRecommendService.getInstance().getRecommend(mbtiBoardNum);		
		int reNum = Integer.parseInt(recommend);
		recommend = String.valueOf(reNum+1);
		MbtiBoardVO recommendMv =new MbtiBoardVO();
		recommendMv.setmbtiboardRecommendednumber(recommend);
		recommendMv.setmbtiboardPostnum(mbtiBoardNum);
		MbtiBoardRecommendService.getInstance().recommend(recommendMv);
		
		// 추천수 컬럼 첫 저장
		MbtiBoardRecommendVO mrv = new MbtiBoardRecommendVO();
		mrv.setMemberId(memberId);
		mrv.setMbtiboardPostnum(mbtiBoardNum);
		MbtiBoardRecommendService.getInstance().recommendInsert(mrv);
		
		
		// 디테일 출력용 
		MbtiBoardVO mv = null;
		mv = MbtiBoardService.getInstance().mbtiBoardDetail(mbtiBoardNum);
		req.setAttribute("mv", mv);
		
		
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/mbtiboard/mbtiboarddetail.jsp");
		dispatcher.forward(req, resp);
	
		
	}
}
