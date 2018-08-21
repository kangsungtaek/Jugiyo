package pro.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pro.vo.MemberVo;

@Repository
public class MemberDao {

	@Autowired
	SqlSessionTemplate template;
	
	//로그인에 필요한 함수; 아이디를 통해서 vo를 불러오는 작업
	public MemberVo findById(String id) {
		return template.selectOne("member.findById", id);
		//member가 mapper이름 findById는 sql문 이름
	}
}
