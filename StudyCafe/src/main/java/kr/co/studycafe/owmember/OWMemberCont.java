package kr.co.studycafe.owmember;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OWMemberCont {
	
	@Autowired
	private OWMemberDAO dao;
	
	public OWMemberCont() {
		System.out.println("---owMemberCont");
	}
	
	@RequestMapping(value="/owmember/owcreate.do", method=RequestMethod.GET)
	public ModelAndView owcreate(OWMemberDTO dto){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("owmember/owcreate");
		return mav;
	}
	
	@RequestMapping(value="/owmember/owcreate.do", method=RequestMethod.POST)
	public ModelAndView owcreateProc(HttpServletRequest request, OWMemberDTO dto){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("owmember/msg");
		String owid=request.getParameter("owid");
	    System.out.println(owid);
		int count = dao.owcreate(dto);
		if(count == 0) {
		      mav.addObject("msg1", "<p>회원가입 실패</p>");
		      mav.addObject("msg2", "<p>ㅇㅇ</p>");
		    }
		    else {
		      mav.addObject("msg1", "<p>회원가입 성공</p>");    
		    }
		    return mav;
		  }//end
	
	//로그인
	@RequestMapping(value = "/owmember/owloginre.do", method = RequestMethod.GET)
	public ModelAndView owloginre(OWMemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("owmember/owloginre");
		return mav;
	}
	
	@RequestMapping(value = "/owmember/owloginre.do", method = RequestMethod.POST)
	public ModelAndView owloginreProc(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String owid = req.getParameter("owid").trim();
		String owpasswd = req.getParameter("owpasswd").trim();
		mav.setViewName("owmember/owloginre"); 
		OWMemberDTO dto=new OWMemberDTO();
		dto = dao.owloginre(owid, owpasswd);
		if (dto != null) {
			HttpSession session=req.getSession();
			session.setAttribute("owid", dto.getOwid());
			session.setAttribute("owpasswd", dto.getOwpasswd());
		}else{
			 mav.addObject("msg1", "<p>로그인실패</p>");
			 mav.addObject("msg2", "<p><a href='javascript:window.history.back();'>[돌아가기]</a></p>"); 
		}
		return mav;
	}// end
	
/*	  @RequestMapping(value="/owmember/owread.do", method=RequestMethod.GET)
	  public ModelAndView owread(String owid) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("owmember/owread");
	    OWMemberDTO dto = dao.owread(owid);
	    mav.addObject("dto", dto);
	    return mav;        
	  }//read() end
*/	  
	//회원정보 수정
	  @RequestMapping(value="/owmember/owloginup.do", method=RequestMethod.GET)
	  public ModelAndView owloginup(OWMemberDTO dto){
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("owmember/owloginup");
	    mav.addObject("dto",dao.owread(dto.getOwid()));
	    return mav;
	  }//updateForm() end
	  
	  @RequestMapping(value="/owmember/owloginup.do", method=RequestMethod.POST)
	  public ModelAndView owloginupProc(OWMemberDTO dto) {
	    ModelAndView mav = new ModelAndView();   
	    mav.setViewName("member/msg");
	    int cnt = dao.owloginup(dto);
	    if(cnt == 0) {
		      mav.addObject("msg1", "<p>수정 실패</p>");
		      mav.addObject("msg2", "<p>ㅇㅇ</p>");
		    }
		    else {
		    	 mav.addObject("msg1", "<p>수정 성공</p>");
		    }
	    return mav;
	  }//end
	  //회원 삭제
	  @RequestMapping(value="/owmember/owloginde.do", method=RequestMethod.GET)
	  public ModelAndView owloginde(OWMemberDTO dto){
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("owmember/owloginde");
	    mav.addObject("dto",dto);
	    return mav;
	  }//deleteForm() end
	  	
	  @RequestMapping(value="/owmember/owloginde.do", method=RequestMethod.POST)
	  public ModelAndView owlogindeProc(HttpServletRequest request, OWMemberDTO dto) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("member/msg");  
	    String owid=request.getParameter("owid");
	    System.out.println(owid);
	    int cnt = dao.owloginde(dto.getOwid());
	    if(cnt == 0) {
	      mav.addObject("msg1", "<p>삭제 실패</p>");
	      mav.addObject("msg2", "<p><a href='javascript:window.history.back();'>[돌아가기]</a></p>");
	    }
	    else {
	      mav.addObject("msg1", "<p>삭제 성공</p>");    
	    }
	    return mav;
	  }//end
}
