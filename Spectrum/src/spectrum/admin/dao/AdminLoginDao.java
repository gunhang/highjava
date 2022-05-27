package spectrum.admin.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import spectrum.admin.vo.AdminVO;
import spectrum.util.SqlMapClientFactory;


public class AdminLoginDao {
	private static AdminLoginDao dao;
	private AdminLoginDao() {
		smc = SqlMapClientFactory.getInstance();
	}
	private SqlMapClient smc;
	public static AdminLoginDao getInstance() {
		if(dao==null) {
			dao = new AdminLoginDao();
		}
		return dao;
	}
	public void adminInsert(AdminVO av) {
		try {
			smc.insert("adminlogin.adminInsert",av);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public String adminCheckId(String adminId) {
		String result =null;
		try {
			result=(String) smc.queryForObject("adminlogin.checkId", adminId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
	}
	public String joinAdmin(AdminVO av) {
		String result = null;
		try {
			result = (String)smc.queryForObject("adminlogin.joinAdmin",av);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	
	
}
