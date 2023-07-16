package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.util.Util;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

@Controller
public class UsrMemberController {
	
	private MemberService memberService;
	private Rq rq;
	
	@Autowired
	public UsrMemberController(MemberService memberService, Rq rq) {
		this.memberService = memberService;
		this.rq = rq;
	}
	
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public String doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email) {
		
		if(Util.empty(loginId)) {
			return Util.jsHistoryBack("아이디를 입력해주세요");
		}
		if(Util.empty(loginPw)) {
			return Util.jsHistoryBack("비밀번호를 입력해주세요");
		}
		if(Util.empty(name)) {
			return Util.jsHistoryBack("이름을 입력해주세요");
		}
		if(Util.empty(nickname)) {
			return Util.jsHistoryBack("닉네임을 입력해주세요");
		}
		if(Util.empty(cellphoneNum)) {
			return Util.jsHistoryBack("전화번호를 입력해주세요");
		}
		if(Util.empty(email)) {
			return Util.jsHistoryBack("이메일을 입력해주세요");
		}
		
		ResultData<Member> doJoinRd = memberService.doJoin(loginId, loginPw, name, nickname, cellphoneNum, email);
		
		return Util.jsReplace(doJoinRd.getMsg(), "login");
	}
	
	@RequestMapping("/usr/member/login")
	public String login() {
		return "usr/member/login";
	}
	
	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public String doLogin(String loginId, String loginPw){
				
		if (rq.getLoginedMemberId() != 0) {
			return Util.jsHistoryBack("로그아웃 후 이용해주세요.");
		}
	
		if(Util.empty(loginId)) {
			return Util.jsHistoryBack("아이디를 입력해주세요.");
		}
		
		if(Util.empty(loginPw)) {
			return Util.jsHistoryBack("비밀번호를 입력해주세요.");
		}
		
		Member member = memberService.getMemberByLoginId(loginId);
		
		this.rq.login(member);
		
		return Util.jsReplace(Util.f("%s 님 로그인 하셨습니다.", member.getNickname()), "/");
	}
	
	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public String doLogout(int id){
		
		if(rq.getLoginedMemberId() == 0) {
			return Util.jsHistoryBack("먼저 로그인 해주세요.");
		}
		
		Member member = memberService.getMemberById(id);
		
		this.rq.logout();
		
		return Util.jsReplace(Util.f("%s 님 정상적으로 로그아웃 되었습니다.", member.getNickname()), "/");
	}
	
	@RequestMapping("/usr/member/myPage")
	public String myPage() {
		return "usr/member/myPage";
	}
	
	@RequestMapping("/usr/member/passwordChk")
	public String passwordChk() {
		return "usr/member/passwordChk";
	}
	
	@RequestMapping("/usr/member/doPasswordChk")
	public String doPasswordChk(String loginPw) {
		
		if(Util.empty(loginPw)) {
			return rq.jsReturnOnView("비밀번호를 입력해주세요");
		}
		
		if(loginPw.equals(rq.getLoginedMember().getLoginPw()) == false) {
			return rq.jsReturnOnView("비밀번호가 일치하지않습니다");
		}
		return "usr/member/modify";
	}
	
	@RequestMapping("/usr/member/doModify")
	@ResponseBody
	public String doModify(String nickname, String cellphoneNum, String email) {
		
		if(Util.empty(nickname)) {
			return Util.jsHistoryBack("닉네임을 입력해주세요");
		}
		
		if(Util.empty(cellphoneNum)) {
			return Util.jsHistoryBack("전화번호를 입력해주세요");
		}
		
		if(Util.empty(email)) {
			return Util.jsHistoryBack("이메일을 입력해주세요");
		}
		
		memberService.doModify(rq.getLoginedMemberId(), nickname, cellphoneNum, email);
		
		Member member = memberService.getMemberById(rq.getLoginedMemberId());
		
		return Util.jsReplace(Util.f("%s 님 회원정보 수정 성공", member.getNickname()), "myPage");
	}
	
	@RequestMapping("/usr/member/passwordModify")
	public String passwordModify() {
		return "usr/member/passwordModify";
	}
	
	@RequestMapping("/usr/member/doPasswordModify")
	@ResponseBody
	public String doPasswordModify(String loginPw, String loginPwChk) {
		
		if (Util.empty(loginPw)) {
			return Util.jsHistoryBack("새 비밀번호를 입력해주세요");
		}
		if (Util.empty(loginPwChk)) {
			return Util.jsHistoryBack("새 비밀번호 확인을 입력해주세요");
		}
		
		if (loginPw.equals(loginPwChk) == false) {
			return Util.jsHistoryBack("비밀번호가 일치하지 않습니다");
		}
		
		memberService.doPasswordModify(rq.getLoginedMemberId(), loginPw);
		
		return Util.jsReplace("비밀번호가 수정되었습니다", "myPage");
	}
}
