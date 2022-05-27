package spectrum.sale.dao;

import java.util.List;


import spectrum.sale.vo.SaleVO;

public interface ISaleDao {
	/**
	 * DB의 Rank 테이블 전체 레코드를 가져와서 List에 담아
	 * 반환하는 메서드
	 * 
	 * @return RankVO객체를 담고 있는 List 객체
	 */
	public List<SaleVO> getALLSaleList();
}
