package spectrum.sale.service;

import java.util.List;


import spectrum.sale.dao.ISaleDao;
import spectrum.sale.dao.SaleDaoImpl;
import spectrum.sale.vo.SaleVO;

public class SaleServiceImpl implements ISaleService {
	
	
	private static ISaleService saleService;
	
		// 사용할 DAO의 객체변수를 선언한다.
	private ISaleDao saleDao;
	
	private SaleServiceImpl() {
		saleDao = SaleDaoImpl.getInstance();
	}
	
	public static ISaleService getInstance() {
		if(saleService == null) {
			saleService = new SaleServiceImpl();
		}
		return saleService;
	}
	
	@Override
	public List<SaleVO> getALLSaleList() {
		return saleDao.getALLSaleList();
	}

}
