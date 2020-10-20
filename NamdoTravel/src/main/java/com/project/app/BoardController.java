package com.project.app;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.app.service.BoardService;
import com.project.app.vo.AddPostVO;
import com.project.app.vo.PostVO;

/**
 * Handles requests for the application home page.
 */

@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	@Autowired
	@Qualifier("boardServiceImpl")
	BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		
	@RequestMapping(value = "/{boardId}", method = RequestMethod.GET)
	public String board(@PathVariable("boardId") int boardId, Model model) {
		List<PostVO> post = boardService.getPost(boardId);
		model.addAttribute("posts",post);
		model.addAttribute("boardIds",boardId);
		
		return "board";
	}
	
//	@RequestMapping(value="/{boardId}/view{postId}", method=RequestMethod.GET)
//	public String view(@PathVariable("boardId") int boardId, @PathVariable("postId") int postId, Model model) {
//		
//		
//		
//		model.addAttribute("posts",post);
//		model.addAttribute("postContents",postContent);
//		return "view";
//	}
	
	@RequestMapping(value="/write{boardId}", method=RequestMethod.GET)
	public String write(@PathVariable("boardId") int boardId, Model model) {
		model.addAttribute("boardIds",boardId);
		return "write";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String uploadPost(@ModelAttribute AddPostVO addPost, Model model) {
		boardService.addPost(addPost);
		
		return "redirect: /" + addPost.getBoardId();
	}
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String view(Model model) {
		
		String postContent = boardService.getPostContent('1');
		System.out.println(postContent);
		
		//model.addAttribute("posts",post);
		model.addAttribute("postContents",postContent);
		return "view";
	}
}
