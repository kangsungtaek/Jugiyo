package pro.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pro.vo.StoreVo;

@Repository
public class StoreDao {
	
	@Autowired
	SqlSessionTemplate template;
	
	//아이디 생성을 위한 sequence 불러오기
	public int getSeq() {
		return template.selectOne("store.getSeq");
	}
	
	//상점등록
	public boolean insertStore(StoreVo vo) {
		Integer i = template.insert("store.addStore", vo);
		return i==1;
	}
}
