package kr.co.studycafe.member;

import java.util.HashMap;

public interface MemberMapper {
	
	/*public ArrayList<MemberDTO> list();*/
	
	public int create(MemberDTO dto);
	
	public MemberDTO loginre(HashMap<String, String> map);
	
	public MemberDTO read(String gid);
	  
	public int loginup(MemberDTO dto);
	  
	public int loginde(String gid);
}
