package kr.co.studycafe.member;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;	
	
	public MemberDAO() {
		System.out.println("---MemberDAO");
	}

/*	public ArrayList<MemberDTO> list(){
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		ArrayList<MemberDTO> list = mapper.list();
		return list;
	}
	
	public int create(MemberDTO dto) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int count = mapper.create(dto);
		return count;
	}*/
	
	public int create(MemberDTO dto) {
		return sqlSession.getMapper(MemberMapper.class).create(dto);
	}
	
	public MemberDTO loginre(String gid,String gpasswd) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("gid", gid);
		map.put("gpasswd", gpasswd);
	    return sqlSession.getMapper(MemberMapper.class).loginre(map);
	  }
	
	  public MemberDTO read(String gid){
		    MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		    return mapper.read(gid);
		  }
	
	  public int loginup(MemberDTO dto){
		    return sqlSession.getMapper(MemberMapper.class).loginup(dto);
		  }
	  
	  public int loginde(String gid) {
		    return sqlSession.getMapper(MemberMapper.class).loginde(gid);
		  }


}
