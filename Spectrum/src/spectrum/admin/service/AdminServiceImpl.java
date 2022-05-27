package spectrum.admin.service;

import java.util.List;


import spectrum.admin.dao.AdminDaoImpl;
import spectrum.admin.dao.IAdminDao;
import spectrum.admin.vo.AdminVO;

public class AdminServiceImpl implements IAdminService{
	
	private static IAdminService adService;
	
	// 사용할 DAO의 객체변수를 선언한다.
	private IAdminDao adDao;

	private AdminServiceImpl() {
		adDao = AdminDaoImpl.getInstance();
	}

	public static IAdminService getInstance() {
		if(adService == null) {
			adService = new AdminServiceImpl();
		}
		return adService;
	}
	
	@Override
	public List<AdminVO> getALLAdminList() {
		return adDao.getALLAdminList();
	}

	@Override
	public AdminVO getAdmin(String adminId) {
		return adDao.getAdmin(adminId);
	}

	@Override
	public int updateAdmin(AdminVO av) {
		return adDao.updateAdmin(av);
	}

	@Override
	public int deleteAdmin(AdminVO av) {
		return adDao.deleteAdmin(av);
	}

}
