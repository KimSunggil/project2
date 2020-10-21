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
		
	// 게시판 게시글 목록
	@RequestMapping(value = "/{boardId}", method = RequestMethod.GET)
	public String board(@PathVariable("boardId") int boardId, Model model) {
		List<PostVO> post = boardService.getPostList(boardId);
		model.addAttribute("posts",post);
		model.addAttribute("boardIds",boardId);
		
		return "board";
	}
	
	// 게시글 본문 화면
	@RequestMapping(value="/view{postId}", method=RequestMethod.GET)
	public String view(@PathVariable("postId") int postId, Model model) {
		PostVO post = boardService.getPost(postId);
		String postContent = boardService.getPostContent(postId);
				
		model.addAttribute("posts",post);
		model.addAttribute("postContents",postContent);
		return "view";
	}
	
	// 게시글 작성 화면 요청
	@RequestMapping(value="/write{boardId}", method=RequestMethod.GET)
	public String write(@PathVariable("boardId") int boardId, Model model) {
		model.addAttribute("boardIds",boardId);
		return "write";
	}
	
	// 게시글 내용 업로드 요청
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String uploadPost(@ModelAttribute AddPostVO addPost, Model model) {
		boardService.addPost(addPost);
		
		return "redirect: /" + addPost.getBoardId();
	}
	
	// 게시글 수정 화면
	@RequestMapping(value="/write_post{postId}", method=RequestMethod.GET)
	public String modifyWrite(@PathVariable("postId") int postId, Model model) {
		PostVO post = boardService.getPost(postId);
		String postContent = boardService.getPostContent(postId);
		
		model.addAttribute("posts",post);
		model.addAttribute("postContents",postContent);
		model.addAttribute("boardIds",postId);
		return "write";
	}
	
	// 게시글 내용 수정 요청
	@RequestMapping(value="/write_post{postId}", method=RequestMethod.POST)
	public String uploadModifyPost(@ModelAttribute AddPostVO addPost, Model model) {
		boardService.modifyPost(addPost);
		
		return "redirect: /" + addPost.getBoardId();
	}
	
	// 게시글 삭제 요청
	@RequestMapping(value="/deletePost{boardId}_{postId}", method=RequestMethod.POST)
	public String deletePost(@PathVariable("boardId") int boardId, @PathVariable("postId") int postId, Model model)
	{
		boardService.deletePost(postId);
		
		return "redirect: /" + boardId;
	}
}
