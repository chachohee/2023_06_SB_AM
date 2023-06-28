package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ArticleService;
import com.example.demo.service.MemberService;
import com.example.demo.util.Util;
import com.example.demo.vo.Article;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

@Controller
public class UsrArticleController {
	
	private ArticleService articleService;

	@Autowired
	public UsrArticleController(ArticleService articleService, MemberService memberService) {
		this.articleService = articleService;
	}

	@RequestMapping("/usr/article/doAdd")
	@ResponseBody
	public ResultData<Article> doAdd(HttpSession session, String title, String body) {
		
		if(session.getAttribute("loginedMemberId") == null) {
			return ResultData.from("F-A", "로그인 후 이용해주세요.");
		}
		
		if(Util.empty(title)) {
			return ResultData.from("F-1", "제목을 입력해주세요.");
		}
		
		if(Util.empty(body)) {
			return ResultData.from("F-2", "내용을 입력해주세요.");
		}
		
		articleService.writeArticle((int) session.getAttribute("loginedMemberId"), title, body);

		int id = articleService.getLastInsertId();

		return ResultData.from("S-1", Util.f("%d번 게시글이 생성되었습니다", id), "article", articleService.getArticleById(id));
	}

	@RequestMapping("/usr/article/list")
	public String showList(HttpSession session, Model model) {
		
		Member loginedMemberId = (Member) session.getAttribute("loginedMemberId");
		
		List<Article> articles = articleService.getArticles();
		
		model.addAttribute("articles", articles);
		model.addAttribute("loginedMemberid", loginedMemberId);
		
		return "usr/article/list";
	}
	
	@RequestMapping("/usr/article/detail")
	public String showDetail(HttpSession session, Model model, int id) {

		int loginedMemberId = 0;
		
		if(session.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int) session.getAttribute("loginedMemberId");
		}
		
		Article article = articleService.getForPrintArticle(id);
		
		model.addAttribute("article", article);
		model.addAttribute("loginedMemberId", loginedMemberId);
		
		return "usr/article/detail";
	}
	
	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public String doDelete(HttpSession session, int id) {
		
		if(session.getAttribute("loginedMemberId") == null) {
			return Util.jsHistoryBack("로그인 후 이용해주세요.");
		}
		
		if(Util.empty(id)) {
			return Util.jsHistoryBack("삭제할 글 번호를 입력해주세요.");
		}
		
		Article foundArticle = articleService.getArticleById(id);
		
		if(foundArticle == null) {
			return Util.jsHistoryBack(Util.f("%d번 게시글은 존재하지 않습니다.", id));
		}
		
		if(foundArticle.getMemberId() != (int) session.getAttribute("loginedMemberId")) {
			return Util.jsHistoryBack("해당 게시물에 대한 권한이 없습니다.");
		}
		
		articleService.deleteArticle(id);
		
		return Util.jsReplace(Util.f("%d번 게시글을 삭제했습니다", id), "list");
	}
	
	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public ResultData<Article> doModify(HttpSession session, int id, String title, String body) {
		
		if(session.getAttribute("loginedMemberId") == null) {
			return ResultData.from("F-A", "로그인 후 이용해주세요.");
		}
		
		if(Util.empty(id)) {
			return ResultData.from("F-1", "수정할 글 번호를 입력해주세요.");
		}
		
		Article foundArticle = articleService.getArticleById(id);
		
		if(foundArticle == null) {
			return ResultData.from("F-2", Util.f("%d번 게시글은 존재하지 않습니다.", id));
		}
		
		//이 게시물 수정 가능한가?(세션에 저장된 memberId랑 게시글에 저장된 memberId가 같은지 확인하는)
		ResultData actorCanModifyRd = articleService.actorCanModify((int) session.getAttribute("loginedMemberId"), foundArticle.getMemberId());
		
		if(actorCanModifyRd.isFail()) {
			return actorCanModifyRd;
		}
		
		return articleService.modifyArticle(id, title, body);
	}
}
