package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.domain.MemberVO;
import com.board.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Inject
	AdminService adminService;
	
	
	// 회원 리스트
	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public void getManage(Model model) throws Exception {
		
		List<MemberVO> list = null;
		list = adminService.mlist();
		
		model.addAttribute("mlist", list);
		
	}
}
