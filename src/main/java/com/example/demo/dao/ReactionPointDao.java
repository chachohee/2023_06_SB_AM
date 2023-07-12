package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.ReactionPoint;

@Mapper
public interface ReactionPointDao {

	@Select("""
				SELECT *
					FROM reactionPoint
					WHERE memberId = #{loginedMemberId}
					AND relTypeCode = #{relTypeCode}
					AND relId = #{relId}
			""")
	ReactionPoint getReactionPoint(int loginedMemberId, String relTypeCode, int relId);

}
