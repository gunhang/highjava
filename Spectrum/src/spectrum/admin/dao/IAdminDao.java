package spectrum.admin.dao;

import java.util.List;


import spectrum.admin.vo.AdminVO;

public interface IAdminDao {
	/**
	 * DB의 Admin 테이블 전체 레코드를 가져와서 List에 담아
	 * 반환하는 메서드
	 * 
	 * @return AdminVO객체를 담고 있는 List 객체
	 */
	public List<AdminVO> getALLAdminList();
	
	/**
	 * 주어진 회원ID가 존재하는지 여부를 알아내기 위한 메서드
	 * @param adminId	검색할 회원 ID
	 * @return	해당회원 ID가 있으면 회원정보 리턴함.
	 */
	public AdminVO getAdmin(String adminId);
	/**
	 * 하나의 AdminVO자료를 이용하여 DB를 update 하는 메서드
	 * 
	 * 
	 * @param mv update할 회원 정보가 담긴 AdminVO객체
	 * @return	작업성공 : 1, 작업실패 : 0
	 *  
	 */
	public int updateAdmin(AdminVO av);
	/**
	 * 하나의 AdminVO자료를 이용하여 DB를 update 하는 메서드
	 * 
	 * 
	 * @param mv update할 회원 정보가 담긴 AdminVO객체
	 * @return	작업성공 : 1, 작업실패 : 0
	 *  
	 */
	public int deleteAdmin(AdminVO av);
}
