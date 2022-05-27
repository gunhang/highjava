package spectrum.admin.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;


import spectrum.admin.vo.AdminVO;
import spectrum.util.SqlMapClientFactory;



public class AdminDaoImpl implements IAdminDao {
	
	private static IAdminDao adDao;
	
	private SqlMapClient smc;
	
	private AdminDaoImpl(){
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IAdminDao getInstance() {
		if(adDao == null) {
			adDao = new AdminDaoImpl();
		}
		return adDao;
	}

	
	@Override
	public List<AdminVO> getALLAdminList() {
		// TODO Auto-generated method stub
		List<AdminVO> adList = new ArrayList<AdminVO>();
		
		try {
			adList = smc.queryForList("admin.getAdminAll");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return adList;	}

	@Override
	public AdminVO getAdmin(String adminId) {
		AdminVO av = new AdminVO();
		
		try {
			av = (AdminVO)smc.queryForObject("admin.getAdmin", adminId);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return av;
	}

	@Override
	public int updateAdmin(AdminVO av) {
		int cnt =0;
		
		try {
		cnt = smc.update("admin.updateAdmin", av);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return cnt;
	}
	public int deleteAdmin(AdminVO av) {
		int cnt =0;
		
		try {
			cnt = smc.update("admin.deleteAdmin", av);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return cnt;
	}

}
