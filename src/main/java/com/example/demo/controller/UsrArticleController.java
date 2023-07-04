package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ArticleService;
import com.example.demo.service.BoardService;
import com.example.demo.service.MemberService;
import com.example.demo.util.Util;
import com.example.demo.vo.Article;
import com.example.demo.vo.Board;
import com.example.demo.vo.Member;
import com.example.demo.vo.Rq;

@Controller
public class UsrArticleController {

	private ArticleService articleService;
	private MemberService memberService;
	private BoardService boardService;

	@Autowired
	public UsrArticleController(ArticleService articleService, MemberService memberService, BoardService boardService) {
		this.articleService = articleService;
		this.memberService = memberService;
		this.boardService = boardService;
	}
	
	@RequestMapping("/usr/article/write")
	public String write(HttpServletRequest req, Model model) {
		
		Rq rq = (Rq) req.getAttribute("rq");
		
		if(rq.getLoginedMemberId() == 0) {
			return  rq.jsReturnOnView(Util.f("게시물 작성 권한이 없습니다."));
		}

		Member member = memberService.getMemberById(rq.getLoginedMemberId());
		
		model.addAttribute("member", member);
		
		return "usr/article/write";
	}

	@RequestMapping("/usr/article/doWrite")
	@ResponseBody
	public String doWrite(HttpServletRequest req, int boardId, String title, String body) {

		Rq rq = (Rq) req.getAttribute("rq");
		
		if (Util.empty(title)) {
			return Util.jsHistoryBack("제목을 입력해주세요.");
		}

		if (Util.empty(body)) {
			return Util.jsHistoryBack("내용을 입력해주세요.");
		}

		articleService.writeArticle(rq.getLoginedMemberId(), boardId, title, body);

		int id = articleService.getLastInsertId();

		return Util.jsReplace(Util.f("%d번 게시글을 작성했습니다", id), Util.f("detail?id=%d", id));
	}

	@RequestMapping("/usr/article/list")
	public String showList(HttpServletRequest req, Model model, int boardId) {
		
		Rq rq = (Rq) req.getAttribute("rq");
		
		Board board = boardService.getBoardById(boardId);
		
		if(board == null) {
			return rq.jsReturnOnView("존재하지않는 게시판입니다.");
		}
		
		List<Article> articles = articleService.getArticles(boardId);
		
		int articlesCnt = articleService.getArticlesCnt(boardId);

		model.addAttribute("articles", articles);
		model.addAttribute("board", board);
		model.addAttribute("articlesCnt", articlesCnt);

		return "usr/article/list";
	}

	@RequestMapping("/usr/article/detail")
	public String showDetail(Model model, int id) {
		
		Article article = articleService.getForPrintArticle(id);

		model.addAttribute("article", article);

		return "usr/article/detail";
	}

	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public String doDelete(HttpServletRequest req, int id) {

		Rq rq = (Rq) req.getAttribute("rq");

		Article foundArticle = articleService.getArticleById(id);

		if (foundArticle == null) {
			return Util.jsHistoryBack(Util.f("%d번 게시글은 존재하지 않습니다.", id));
		}

		if (foundArticle.getMemberId() != rq.getLoginedMemberId()) {
			return Util.jsHistoryBack("해당 게시물에 대한 권한이 없습니다.");
		}

		articleService.deleteArticle(id);

		return Util.jsReplace(Util.f("%d번 게시글을 삭제했습니다", id), "list");
	}
	
	@RequestMapping("/usr/article/modify")
	public String showModify(HttpServletRequest req, Model model, int id) {
		
		Rq rq = (Rq) req.getAttribute("rq");
		
		Article article = articleService.getForPrintArticle(id);

		if(article == null) {
			return rq.jsReturnOnView(Util.f("%d번 게시물은 존재하지 않습니다.", id));
		}
		
		if(rq.getLoginedMemberId() != article.getMemberId()) {
			return rq.jsReturnOnView(Util.f("해당 게시물에 대한 권한이 없습니다."));
		}
		
		model.addAttribute("article", article);
		
		return "usr/article/modify";
	}

	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public String doModify(HttpServletRequest req, int id, String title, String body) {

		Rq rq = (Rq) req.getAttribute("rq");
		
		Article article = articleService.getArticleById(id);

		if (article == null) {
			return Util.jsHistoryBack(Util.f("%d번 게시글은 존재하지 않습니다", id));
		}

		if (rq.getLoginedMemberId() != article.getMemberId()) {
			return Util.jsHistoryBack("해당 게시글에 대한 권한이 없습니다");
		}

		articleService.modifyArticle(id, title, body);

		return Util.jsReplace(Util.f("%d번 게시글을 수정했습니다", id), Util.f("detail?id=%d", id));
	}

}
