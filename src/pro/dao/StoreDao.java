package pro.dao;

import java.util.List;

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
	// 음식점 조회 전체보기 / 음식점 종류별
	public List<StoreVo> storeLIst(String type){
		if(type.equals("all")) {
			return template.selectList("store.getAll");
		}else {
			return template.selectList("store.getType",type);
		}
	}

	public StoreVo getStore(int storeNo) {
		return template.selectOne("store.getStore", storeNo);
	}
	
}
