package kr.co.studycafe.owmember;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class OWMemberDAO {

	@Autowired
	private SqlSession sqlSession;

	public OWMemberDAO() {
		System.out.println("---owMemberDAO");
	}
	
	public int owcreate(OWMemberDTO dto) {
		return sqlSession.getMapper(OWMemberMapper.class).owcreate(dto);
	}

	public OWMemberDTO owloginre(String owid, String owpasswd) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("owid", owid);
		map.put("owpasswd", owpasswd);
		return sqlSession.getMapper(OWMemberMapper.class).owloginre(map);
	}

	public OWMemberDTO owread(String owid) {
		OWMemberMapper mapper = sqlSession.getMapper(OWMemberMapper.class);
		return mapper.owread(owid);
	}

	public int owloginup(OWMemberDTO dto) {
		return sqlSession.getMapper(OWMemberMapper.class).owloginup(dto);
	}

	public int owloginde(String owid) {
		return sqlSession.getMapper(OWMemberMapper.class).owloginde(owid);
	}

}
