package kr.or.ddit.basic;

import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.UnknownHostException;

public class InetAddressTest {
 public static void main(String[] args) throws UnknownHostException {
	//InetAddress클래스 => IP주소를 다루기 위한 클래스
	 
	//getByName()메서드는 www.naver.com 또는 SEM-PC등과 같은 머신이름이나 
	 //IP주소를 파라미터값을 이용하여 유효한 InetAddress객체를 제공한다.
	 
	 //Naver사이트의 ip정보 가져오기
	 InetAddress naverIp= InetAddress.getByName("www.naver.com");
	 System.out.println("Host Name => "+naverIp.getHostName());
	 System.out.println("Host Address => "+naverIp.getHostAddress());
	 System.out.println();
	 
	 //자기자신 컴퓨터의 IP정보 가져오기
	 InetAddress localIP = InetAddress.getLocalHost();
	 System.out.println("내 컴퓨터의 Host Name => "+localIP.getHostName());
	 System.out.println("내 컴퓨터의 Host Address => "+localIP.getHostAddress());
	 System.out.println();
	 
	 //IP주소가 여러개인 호스트의 정보 가져오기
	 InetAddress[] naverIps = InetAddress.getAllByName("www.naver.com");
	 for(InetAddress nIp : naverIps) {
		 System.out.println(nIp.toString());
	 }
}
}
