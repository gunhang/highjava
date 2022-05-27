package spectrum.payment.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.payment.vo.PaymentVO;
import spectrum.util.SqlMapClientFactory;

public class PaymentDao {

	private static PaymentDao dao;

	private SqlMapClient smc;

	private PaymentDao() {
		smc = SqlMapClientFactory.getInstance();
	}

	public static PaymentDao getInstance() {
		if (dao == null) {
			dao = new PaymentDao();
		}
		return dao;
	}

	public int insertPayment(PaymentVO pv) {

		int cnt = 0;

		try {
			cnt = smc.update("memberspec.insertPayment", pv);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public int checkPayment(PaymentVO pv) {

		int cnt = 0;

		try {
			cnt =(int)smc.queryForObject("memberspec.checkPayment", pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public int insertFirstPayment(PaymentVO pv) {

		int cnt = 0;

		try {
			cnt = smc.update("memberspec.insertFirstPayment", pv);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int updateHeart(PaymentVO pv) {
		int cnt = 0;

		try {
			cnt = smc.update("memberspec.updateHeart", pv);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
		
		
	}
	

}
