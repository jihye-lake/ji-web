package com.board.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.MemberVO;
import com.board.domain.tags_BoardVO;
import com.board.service.MemberService;

@Controller
@RequestMapping("/member/*")
/* @SessionAttributes("login") */
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void getHome(Locale locale, Model model) {
		
		/* logger.info("Welcome home! The client locale is {}.", locale); */
		
		logger.info("________________login 으로 이동합니다_______________");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
	}
	
	// 회원가입 get
	@RequestMapping(value = "/sign_up", method = RequestMethod.GET)
	public void getSignUp(Model model) throws Exception {
		logger.info("_______회원가입을 하겠습니다________");
		
		// 태그 목록
		List<tags_BoardVO> taglist = null;
		taglist = memberService.taglist();
		
		model.addAttribute("taglist", taglist);
	}
	
	// 회원가입 post
	@RequestMapping(value = "/sign_up", method = RequestMethod.POST)
	public String postSignUp(MemberVO mvo, tags_BoardVO tvo) throws Exception {
		logger.info("__________회원가입을 성공적으로 완료했습니다__________");
		logger.info("아이디 : " + mvo.getMember_id());
		logger.info("비밀번호 : " + mvo.getMember_pwd());		
		logger.info("태그 : " + mvo.getMember_tags());
		
		logger.info("태그번호 : " + tvo.getNO());		
		logger.info("태그테이블 추가 태그 : " + tvo.gettags());
		
		/* 비밀번호 암호화
		String inputPass = mvo.getMember_pwd();
		String pass = passwordEncoder.encode(inputPass);
		mvo.setMember_pwd(pass);
		*/		
		
		memberService.signUp(mvo);
		memberService.signUp_tags(tvo);
		
		return "board/home";
	}
	
	//아이디 중복체크	
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(MemberVO mvo) throws Exception {
		logger.info("_____________아이디 중복체크를 합니다___________");
		int result = memberService.idChk(mvo);
		return result;
		
	}
	
	
	// 로그인 아이디&비번 체크
	@ResponseBody
	@RequestMapping(value = "/IdPwChk", method = RequestMethod.POST)
	public int IdPwChk(MemberVO mvo, HttpSession session) throws Exception {
		//public int IdPwChk(MemberVO mvo, HttpServletRequest req) throws Exception {
		logger.info("_______아이디&비밀번호 중복체크를 합니다_______");
		int result = memberService.IdPwChk(mvo);
		
		logger.info("___________________________________________________________");
		
		logger.info("____________로그인을 할 겁니다.___________");
		
		logger.info("아이디 : " + mvo.getMember_id());
		logger.info("비밀번호 : " + mvo.getMember_pwd());
		logger.info("________아이디와 비밀번호는 준비되었습니다._______");
		
		//HttpSession session = req.getSession();
		
		MemberVO login = memberService.login(mvo);
		
		logger.info("________여기까지 왔나?_______");
		
		if(login == null) {
			session.setAttribute("member", null);
		} else {
			session.setAttribute("member", login);
		}
		return result;
	}
	
	@RequestMapping(value = "/member_info", method = RequestMethod.GET)
	public void getMember_info() throws Exception {
		logger.info("_____________회원정보 변경_____________");
	}
	

	/*
	// 로그인
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST) // method를 post로 하고, jsp 에서 form=method=post 로 해주면 url 에 안 나타남
	public ModelAndView loginCheck(MemberVO mvo, HttpSession session, Locale locale, Model model, HttpServletRequest hsr) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);		
		String formattedDate = dateFormat.format(date);		
		model.addAttribute("serverTime", formattedDate );
		
		logger.info("_____지금부터 로그인을 할 겁니다_____");
		
		session = hsr.getSession();
		
	 // boolean result = memberService.loginCheck(mvo, session); 
		MemberVO login = memberService.loginCheck(mvo);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("member/login");
		
		if(login1 != null) {
			mav.addObject("msg", "성공");
			session.setAttribute("login", login1);
			logger.info("__________로그인 성공________");
			logger.info(mvo.getMember_id() + "아이디 입니다.");
			logger.info(mvo.getMember_pwd() + "비밀번호 입니다.");
		} else {
			mav.addObject("msg", "실패");
			logger.info("__________로그인 실패________");
		}
		
		
		if(login == null) {
			mav.addObject("msg", "fail");
			logger.info("__________로그인 실패________");
			logger.info(mvo.getMember_id() + "아이디 입니다.");
			logger.info(mvo.getMember_pwd() + "비밀번호 입니다.");
		} else {
			mav.addObject("msg", "success");
			session.setAttribute("login", login);
			logger.info("__________로그인 성공________");
			logger.info(mvo.getMember_id() + "아이디 입니다.");
			logger.info(mvo.getMember_pwd() + "비밀번호 입니다.");
		}
		
		return mav;
	}

*/
	
	// 로그아웃
	// @RequestMapping("logout")
	@RequestMapping(value = "/logout", method = {RequestMethod.POST, RequestMethod.GET})
	public String logout(HttpSession session, HttpServletResponse response) throws Exception {
		
		
		memberService.logout(session);
		ModelAndView mav = new ModelAndView();
//		mav.setViewName("member/login");
		mav.addObject("msg", "logout");
		
/*		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println("<script>alert('성공적으로 로그아웃되었습니다.');</script>");
		out.flush();
*/		
		logger.info("__________로그아웃 완료________");
		
		return "redirect:/board/home";
		//return"../board/home";
	}

}
