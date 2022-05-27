package spectrum.sale.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.board.vo.NoticeBoardVO;
import spectrum.rank.dao.IRankDao;
import spectrum.rank.dao.RankDaoImpl;
import spectrum.sale.vo.SaleVO;
import spectrum.util.SqlMapClientFactory;

public class SaleDaoImpl implements ISaleDao {
	
	private static ISaleDao saleDao;
	
	private SqlMapClient smc;
	
	private  SaleDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static ISaleDao getInstance() {
		if(saleDao == null) {
			saleDao = new SaleDaoImpl();
		}
		return saleDao;
	}
	
	@Override
	public List<SaleVO> getALLSaleList() {
		List<SaleVO> saleList = new ArrayList<SaleVO>();
		
		try {
			saleList = smc.queryForList("sale.getALLSaleList");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return saleList;
	
	}
	
}
