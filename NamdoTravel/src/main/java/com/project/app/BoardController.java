package com.project.app;

import java.security.Principal;
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
import com.project.app.vo.ReplyVO;

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
	public String view(Principal principal, @PathVariable("postId") int postId, Model model) {
		
		boardService.plusHits(postId);
		
		// 본문 내용 소환
		PostVO post = boardService.getPost(postId);
	
		if(principal != null)
			model.addAttribute("principals", principal.getName());
		
		model.addAttribute("posts",post);
		
		//댓글 내용 소환
		List<ReplyVO> reply = boardService.getReplyList(postId);
		model.addAttribute("replys", reply);
				
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
		System.out.println("Insert Active!  " + addPost.getBoardId());
		
		return "redirect: /" + addPost.getBoardId();
	}
	
	// 게시글 수정 화면
	@RequestMapping(value="/write_post{postId}", method=RequestMethod.GET)
	public String modifyWrite(@PathVariable("postId") int postId, Model model) {
		PostVO post = boardService.getPost(postId);
		int boardIds = post.getBoardId();
		
		model.addAttribute("posts",post);
		model.addAttribute("boardIds",boardIds);
		return "write";
	}
	
	// 게시글 내용 수정 요청
	@RequestMapping(value="/write{postId}", method=RequestMethod.POST)
	public String uploadModifyPost(@ModelAttribute PostVO addPost, Model model) {
		boardService.modifyPost(addPost);
		System.out.println("Update Active!" + addPost.getBoardId());
		
		return "redirect: /" + addPost.getBoardId();
	}
	
	// 게시글 삭제 요청
	@RequestMapping(value="/delete_Post{boardId}_{postId}", method=RequestMethod.POST)
	public String deletePost(@PathVariable("boardId") int boardId, @PathVariable("postId") int postId, Model model){
		boardService.deletePost(postId);
		
		return "redirect: /" + boardId;
	}
	
	//좋아요 싫어요
	@RequestMapping(value="/board/favor{postId}_{favor}", method=RequestMethod.POST)
	public String favor(@PathVariable("postId") int postId, @PathVariable("favor") String favor, Model model) {
		
//		Map<String,String> map = new Map<String,String>();
//		map.put(userId, );
//		
//		boardService.seachPostFavor(map);
		
		return "redirect: /view" + postId ;
	}
	
	// ================ 멋글 관련 ==============================
	//댓글 업로드 요청
	@RequestMapping(value="/write_reply", method=RequestMethod.POST)
	public String writeReply(@ModelAttribute ReplyVO reply, Model model){
		boardService.addReply(reply);
		
		return "redirect: /view" + reply.getPostId();
	}
	
	//댓글 수정 요청
	@RequestMapping(value="/write_reply{postId}", method=RequestMethod.POST)
	public String writeRelply(@PathVariable("postId") int postId, @ModelAttribute ReplyVO reply, Model model) {
		boardService.modifyReply(reply);
		
		return "redirect: /view" + postId;
	}
	
	//댓글 삭제 요청
	@RequestMapping(value="/delete_reply", method=RequestMethod.POST)
	public String deleteReply(@ModelAttribute("reply") ReplyVO reply, Model model)
	{
		int way = reply.getPostId();
		boardService.deleteReply(reply.getReplyId());
		return "redirect: /view" + way;
	}
}
