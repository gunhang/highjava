package spectrum.admin.service;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.admin.dao.AdminLoginDao;
import spectrum.admin.vo.AdminVO;
import spectrum.util.SqlMapClientFactory;

public class AdminLoginService {
	private static AdminLoginService dao;
	private AdminLoginService() {
		smc = SqlMapClientFactory.getInstance();
	}
	private SqlMapClient smc;
	public static AdminLoginService getInstance() {
		if(dao==null) {
			dao = new AdminLoginService();
		}
		return dao;
	}
	
	
	public void adminInsert(AdminVO av) {
		AdminLoginDao.getInstance().adminInsert(av);
		
	}
	public String adminCheckId(String adminId) {
		return AdminLoginDao.getInstance().adminCheckId(adminId);
	}
	
	public String joinAdmin(AdminVO av) {
		return AdminLoginDao.getInstance().joinAdmin(av);
	}
}
