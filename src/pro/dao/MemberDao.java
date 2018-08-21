package pro.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pro.vo.MemberVo;

@Repository
public class MemberDao {

	@Autowired
	SqlSessionTemplate template;
	
	//로그인에 필요한 함수, 아이디를 통해서 vo를 불러오는 작업
	public MemberVo findById(String id) {
		return template.selectOne("member.findById", id);
		//member가 mapper이름 findById는 sql문 이름
	}
	
	public int getSequence() {
		return template.selectOne("member.getSequence");
	}
	
	public int addMember(MemberVo vo) {
		return template.insert("member.addMemberVo", vo);
	}
	
	public List<MemberVo> findStartWith(String id) {
		return template.selectList("member.findStartWith", id);
		
	}
}
