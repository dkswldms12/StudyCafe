package kr.co.studycafe.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberCont {
	
	@Autowired
	private MemberDAO dao;
		
	public MemberCont() {
		System.out.println("---MemberCon");
	}

/*	@RequestMapping("/member/list.do")
	public ModelAndView list(){
		ModelAndView mav= new ModelAndView();
		mav.setViewName("member/list");
		ArrayList<MemberDTO> list = dao.list();
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value="/member/create.do", method=RequestMethod.GET)
	public ModelAndView create(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/create");
		return mav;
	}
	
	@RequestMapping(value="/member/create.do", method=RequestMethod.POST)
	public ModelAndView createProc(MemberDTO dto){
		ModelAndView mav = new ModelAndView();
		int count = dao.create(dto);
		mav.setViewName("redirect:/member/list.do");
		return mav;
	}*/
	
	@RequestMapping(value="/member/create.do", method=RequestMethod.GET)
	public ModelAndView create(MemberDTO dto){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/create");
		return mav;
	}
	
	@RequestMapping(value="/member/create.do", method=RequestMethod.POST)
	public ModelAndView createProc(HttpServletRequest request, MemberDTO dto){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/msg");
		String gid=request.getParameter("gid");
	    System.out.println(gid);
		int count = dao.create(dto);
		if(count == 0) {
		      mav.addObject("msg1", "<p>회원가입 실패</p>");
		      mav.addObject("msg2", "<p>ㅇㅇ</p>");
		    }
		    else {
		      mav.addObject("msg1", "<p>회원가입 성공</p>");    
		    }
		    return mav;
		  }//end
	
	@RequestMapping(value = "/member/loginre.do", method = RequestMethod.GET)
	public ModelAndView loginre(MemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/loginre");
		return mav;
	}

	@RequestMapping(value = "/member/loginre.do", method = RequestMethod.POST)
	public ModelAndView loginreProc(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String gid = req.getParameter("gid").trim();
		String gpasswd = req.getParameter("gpasswd").trim();
		mav.setViewName("member/loginre"); 
		MemberDTO dto=new MemberDTO();
		dto = dao.loginre(gid, gpasswd);
		if (dto != null) {
			HttpSession session=req.getSession();
			session.setAttribute("gid", dto.getGid());
			session.setAttribute("gpasswd", dto.getGpasswd());
		}else{
			 mav.addObject("msg1", "<p>로그인실패</p>");
			 mav.addObject("msg2", "<p><a href='javascript:window.history.back();'>[돌아가기]</a></p>"); 
		}
		return mav;
	}// end
	
	 /* @RequestMapping(value="/member/read.do", method=RequestMethod.GET)
	  public ModelAndView read(String gid) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("member/read");
	    MemberDTO dto = dao.read(gid);
	    mav.addObject("dto", dto);
	    return mav;        
	  }//read() end
*/	
	  @RequestMapping(value="/member/loginup.do", method=RequestMethod.GET)
	  public ModelAndView loginup(MemberDTO dto){
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("member/loginup");
	    mav.addObject("dto",dao.read(dto.getGid()));
	    return mav;
	  }//updateForm() end
	  
	  @RequestMapping(value="/member/loginup.do", method=RequestMethod.POST)
	  public ModelAndView loginupProc(MemberDTO dto) {
	    ModelAndView mav = new ModelAndView();   
	    mav.setViewName("member/msg");
	    int cnt = dao.loginup(dto);
	    if(cnt == 0) {
		      mav.addObject("msg1", "<p>수정 실패</p>");
		      mav.addObject("msg2", "<p>ㅇㅇ</p>");
		    }
		    else {
		    	 mav.addObject("msg1", "<p>수정 성공</p>");
		    }
	    return mav;
	  }//end
	  
	  @RequestMapping(value="/member/loginde.do", method=RequestMethod.GET)
	  public ModelAndView loginde(MemberDTO dto){
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("member/loginde");
	    mav.addObject("dto",dto);
	    return mav;
	  }//deleteForm() end
	  	
	  @RequestMapping(value="/member/loginde.do", method=RequestMethod.POST)
	  public ModelAndView logindeProc(HttpServletRequest request, MemberDTO dto) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("member/msg");  
	    String id=request.getParameter("gid");
	    System.out.println(id);
	    int cnt = dao.loginde(dto.getGid());
	    if(cnt == 0) {
	      mav.addObject("msg1", "<p>삭제 실패</p>");
	      mav.addObject("msg2", "<p>ㅇㅇ</p>");
	    }
	    else {
	      mav.addObject("msg1", "<p>삭제 성공</p>");    
	    }
	    return mav;
	  }//end
}
