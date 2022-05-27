package spectrum.payment.service;

import spectrum.payment.dao.PaymentDao;
import spectrum.payment.vo.PaymentVO;

public class PaymentService {

	private static PaymentService paymentService;

	private PaymentDao paymentDao;

	private PaymentService() {
		paymentDao = PaymentDao.getInstance();
	}

	public static PaymentService getInstance() {
		if (paymentService == null) {
			paymentService = new PaymentService();
		}
		return paymentService;
	}

	public int checkPayment(PaymentVO pv) {
		return paymentDao.checkPayment(pv);
	}

	public int insertPayment(PaymentVO pv) {
		return paymentDao.insertPayment(pv);
	}

	public int insertFirstPayment(PaymentVO pv) {
		return paymentDao.insertFirstPayment(pv);

	}
	
	public int updateHeart(PaymentVO pv) {
		return paymentDao.updateHeart(pv);
	}

}
