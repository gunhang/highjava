
package spectrum.myspectrum.vo;


public class FriendVO{
	
	private String friendNum;
	private String friendAppliedId;
	private String friendRequestedId;
	private String friendFriendyn;
	
	
	
	public FriendVO() {
	}
	public FriendVO(String friendNum, String friendAppliedId, String friendRequestedId, String friendFriendyn) {
		this.friendNum = friendNum;
		this.friendAppliedId = friendAppliedId;
		this.friendRequestedId = friendRequestedId;
		this.friendFriendyn = friendFriendyn;
	}
	public String getFriendNum() {
		return friendNum;
	}
	public void setFriendNum(String friendNum) {
		this.friendNum = friendNum;
	}
	public String getFriendAppliedId() {
		return friendAppliedId;
	}
	public void setFriendAppliedId(String friendAppliedId) {
		this.friendAppliedId = friendAppliedId;
	}
	public String getFriendRequestedId() {
		return friendRequestedId;
	}
	public void setFriendRequestedId(String friendRequestedId) {
		this.friendRequestedId = friendRequestedId;
	}
	public String getFriendFriendyn() {
		return friendFriendyn;
	}
	public void setFriendFriendyn(String friendFriendyn) {
		this.friendFriendyn = friendFriendyn;
	}

  
    
}