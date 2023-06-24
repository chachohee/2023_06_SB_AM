package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.util.Util;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

@Controller
public class UsrMemberController {
	
	private MemberService memberService;
	
	@Autowired
	public UsrMemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public ResultData<Member> doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email) {
		
		if(Util.empty(loginId)) {
			return ResultData.from("F-1", "아이디를 입력해주세요");
		}
		if(Util.empty(loginPw)) {
			return ResultData.from("F-2", "비밀번호를 입력해주세요");
		}
		if(Util.empty(name)) {
			return ResultData.from("F-3", "이름을 입력해주세요");
		}
		if(Util.empty(nickname)) {
			return ResultData.from("F-4", "닉네임을 입력해주세요");
		}
		if(Util.empty(cellphoneNum)) {
			return ResultData.from("F-5", "전화번호를 입력해주세요");
		}
		if(Util.empty(email)) {
			return ResultData.from("F-6", "이메일을 입력해주세요");
		}
		
		ResultData<Member> doJoinRd = memberService.doJoin(loginId, loginPw, name, nickname, cellphoneNum, email);
		
		return doJoinRd;
	}
	
	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public ResultData<Member> doLogin(HttpSession session, String loginId, String loginPw){
		
		if(session.getAttribute("loginedMemberId") != null) {
			
			Member loginedMember = memberService.getMemberById((int) session.getAttribute("loginedMemberId"));
			
			return ResultData.from("F-A", Util.f("%s 님이 이미 로그인한 상태입니다.", loginedMember.getLoginId()));
		}
		
		if(Util.empty(loginId)) {
			return ResultData.from("F-1", "아이디를 입력해주세요");
		}
		
		if(Util.empty(loginPw)) {
			return ResultData.from("F-2", "비밀버호를 입력해주세요");
		}
		
		Member member = memberService.getMemberByLoginId(loginId);
		
		if(member == null) {
			return ResultData.from("F-3", Util.f("%s 은(는) 존재하지 않는 아이디입니다.", loginId));
		}
		
		if(member.getLoginPw().equals(loginPw) == false) {
			return ResultData.from("F-4", "비밀번호가 일치하지 않습니다.");
		}
		
		session.setAttribute("loginedMemberId", member.getId());
		
		return ResultData.from("S-1", Util.f("%s 님이 로그인하였습니.", member.getNickname()));
	}
	
	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public ResultData doLogout(HttpSession session, String loginId){
		
		if(session.getAttribute("loginedMemberId") == null) {
			return ResultData.from("F-A", "이미 로그아웃 상태입니다.");
		}
		
		Member loginedMember = memberService.getMemberById((int) session.getAttribute("loginedMemberId"));
		
		session.removeAttribute("loginedMemberId");
		
		return ResultData.from("S-1", Util.f("%s 님 정상적으로 로그아웃 되었습니다.", loginedMember.getLoginId()));
	}
}
