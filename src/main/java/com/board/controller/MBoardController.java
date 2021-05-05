package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.domain.BoardVO;
import com.board.domain.MBoardVO;
import com.board.service.MBoardService;

@Controller
@RequestMapping("/img_board/*")
public class MBoardController {
	
	@Inject
	MBoardService mservice;
	MBoardVO vo;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// 게시물 목록
	@RequestMapping(value = "/img_list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {
		
		List<MBoardVO> list = null;
		list = mservice.list();
		
		model.addAttribute("List", list);
	}
	
	// 게시물 작성 GET
	@RequestMapping(value = "/img_write", method = RequestMethod.GET)
	public void getWrite() throws Exception {
		
	}
	
	// 게시물 작성 POST
	@RequestMapping(value = "/img_write", method = RequestMethod.POST)
	public String postWrite(MBoardVO vo) throws Exception {		
		mservice.write(vo);
		
		return "redirect:/img_board/img_list";
	}

}
