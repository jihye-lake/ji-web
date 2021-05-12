package com.board.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
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
	public void getSignUp() {
		logger.info("_______회원가입을 하겠습니다________");
	}
	
	// 회원가입 post
	@RequestMapping(value = "/sign_up", method = RequestMethod.POST)
	public String postSignUp(MemberVO mvo) throws Exception {
		logger.info("__________회원가입을 성공적으로 완료했습니다__________");
		
		String inputPass = mvo.getMember_pwd();
		String pass = passwordEncoder.encode(inputPass);
		mvo.setMember_pwd(pass);
		
		memberService.signUp(mvo);
		
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
	
/*	
	// 로그인
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public String loginCheck(MemberVO mvo, HttpServletRequest req) throws Exception {
		
		logger.info("____________로그인을 할 겁니다.___________");
		
		logger.info(mvo.getMember_id() + "아이디");
		logger.info(mvo.getMember_pwd() + "비밀번호");
		logger.info("________아이디와 비밀번호는 준비되었습니다._______");
		
		HttpSession session = req.getSession();
		
		MemberVO login = memberService.loginCheck(mvo);
		
		if(login == null) {
			session.setAttribute("member", null);
		} else {
			session.setAttribute("member", login);
		}
		
		return "board/home";
	}
*/	

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
