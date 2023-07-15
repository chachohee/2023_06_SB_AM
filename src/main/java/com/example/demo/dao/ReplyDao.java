package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Reply;

@Mapper
public interface ReplyDao {

	@Insert("""
			INSERT INTO reply
				SET updateDate = NOW()
					, memberId = #{loginedMemberId}
					, relTypeCode = #{relTypeCode}
					, relId = #{relId}
					, `body` = #{body}
			""")
	void writeReply(int loginedMemberId, String relTypeCode, int relId, String body);

	@Select("""
			SELECT r.*, m.nickname AS writerName
				FROM reply AS r
				LEFT JOIN `member` AS m
				ON r.memberId = m.id
				WHERE relTypeCode = #{relTypeCode}
				AND relId = #{relId}
			""")
	List<Reply> getReplies(String relTypeCode, int relId);

}
