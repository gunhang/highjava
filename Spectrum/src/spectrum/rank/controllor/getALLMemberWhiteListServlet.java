package spectrum.rank.controllor;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.List;
import java.util.TimerTask;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.Timer;

import org.apache.tomcat.jni.Time;

import spectrum.rank.service.IRankService;
import spectrum.rank.service.RankServiceImpl;
import spectrum.rank.vo.RankVO;

@WebServlet("/rank/ranklist.do")
public class getALLMemberWhiteListServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. 서비스 객체 생성하기
		IRankService rankService = RankServiceImpl.getInstance();

		// 2. 회원정보 조회
		List<RankVO> rankList = rankService.getALLMemberWhiteList();
		rankList = rankService.getALLMemberWhiteList();

		int size = rankList.size();
		if (size > 0) {
			for (int m = 0; m < size; m++) {
				String memberId = rankList.get(m).getMemberId();
				String payment = rankService.getTotalPayment(memberId);
				if (payment != null) {

					int totalPayment = Integer.valueOf(rankService.getTotalPayment(memberId));
					if (50000 <= totalPayment && totalPayment < 100000) {
						rankService.updateRankYellow(memberId);
					} else if (100000 <= totalPayment && totalPayment < 500000) {
						rankService.updateRankPurple(memberId);
					} else if (500000 <= totalPayment) {
						rankService.updateRankRainbow(memberId);
					}
				}

			}
		}

		LocalDate date = LocalDate.now();
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String today = date.format(dateTimeFormatter);

		int rankSize = rankList.size();
		if (rankSize > 0) {
			for (int i = 0; i < rankSize; i++) {

				// System.out.println(rankList.get(i).getRankBenefit());
				if (rankList.get(i).getRankBenefit().equals(today)) {

					if (rankList.get(i).getRankMemrank().equals("WHITE")) {
						if (rankList.get(i).getRankBenefit().equals(today)) {
							rankService.updateHeartWhiteMember(rankList.get(i).getMemberId());
						}
						rankService.updateRankBenfitAfter(rankList.get(i).getMemberId());

					}
					if (rankList.get(i).getRankMemrank().equals("YELLOW")) {
						if (rankList.get(i).getRankBenefit().equals(today)) {
							rankService.updateHeartYellowMember(rankList.get(i).getMemberId());
						}
						rankService.updateRankBenfitAfter(rankList.get(i).getMemberId());

					}
					if (rankList.get(i).getRankMemrank().equals("PURPLE")) {
						if (rankList.get(i).getRankBenefit().equals(today)) {
							rankService.updateHeartPurpleMember(rankList.get(i).getMemberId());
						}
						rankService.updateRankBenfitAfter(rankList.get(i).getMemberId());

					}
					if (rankList.get(i).getRankMemrank().equals("RAINBOW")) {
						if (rankList.get(i).getRankBenefit().equals(today)) {
							rankService.updateHeartRainbowMember(rankList.get(i).getMemberId());

						}

						rankService.updateRankBenfitAfter(rankList.get(i).getMemberId());

					}
				}

			}

		}
		req.setAttribute("rankList", rankList);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/rank/ranklist.jsp");
		dispatcher.forward(req, resp); // 뷰페이지로 전달

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
