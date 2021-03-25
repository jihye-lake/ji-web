package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.domain.MBoardVO;
import com.board.service.MBoardService;

@Controller
@RequestMapping("/img_board/*")
public class MBoardController {
	
	@Inject
	MBoardService mservice;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// 게시물 목록
	@RequestMapping(value = "/img_list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {
		
		List<MBoardVO> list = null;
		list = mservice.list();
		
		model.addAttribute("List", list);
	}

}
