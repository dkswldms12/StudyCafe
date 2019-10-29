package kr.co.studycafe.owmember;

import java.util.HashMap;

public interface OWMemberMapper {
	
	public int owcreate(OWMemberDTO dto);
	
	public OWMemberDTO owloginre(HashMap<String, String> map);
	
	public OWMemberDTO owread(String owid);
	  
	public int owloginup(OWMemberDTO dto);
	  
	public int owloginde(String owid);
}
