package pro.dao;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import org.bson.Document;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import pro.vo.LogVo;
import pro.vo.ReviewVo;
import pro.vo.StoreVo;

@Repository
public class StoreDao {
	
	@Autowired
	SqlSessionTemplate template;
	@Autowired
	MongoTemplate mongoTemplate;
	
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
	
	public List<StoreVo> searchStoreMenu(String search) {
		return template.selectList("store.searchStoreMenu", search);
	}

	public StoreVo login(Map m) {
		return template.selectOne("store.login",m);
	}
	
	public List<ReviewVo> findReview(int no) {
		System.out.println("[storeDao:mongo]");
		
		Query query = new BasicQuery(new Document().append("no", no));
		System.out.println("[storeDao:mongo] " + query);
		
		return mongoTemplate.find(query, ReviewVo.class, "review");
	}
	
}
