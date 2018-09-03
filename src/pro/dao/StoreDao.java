package pro.dao;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import org.bson.Document;
import org.bson.types.ObjectId;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.BasicUpdate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
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
	
	//반경계산한 음식점조회
	public List<StoreVo> getStoreByCoords(Map map) {
		return template.selectList("store.getStoreByCoords", map);
	}
	//반경계산한 음식점조회-타입별
	public List<StoreVo> getStoreByCoordsWithType(Map map) {
		return template.selectList("store.getStoreByCoordsWithType", map);
	}

	public StoreVo getStore(int storeNo) {
		return template.selectOne("store.getStore", storeNo);
	}
	
	public List<StoreVo> searchStoreMenu(String search) {
		return template.selectList("store.searchStoreMenu", search);
	}
	//반경계산 음식점조회-검색
	public List<StoreVo> searchStoreMenuByCoords(Map map) {
		return template.selectList("store.searchStoreMenuByCoords", map);
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
	
	public List<LogVo> findLogByStoreNo(int storeNo) {
		Query query = new BasicQuery(new Document().append("storeNo", storeNo));
		return mongoTemplate.find(query, LogVo.class, "log");
	}
	
	public void updateReply(Map m) {
		System.out.println("[storeDao:mongo]");
		Query query = Query.query(Criteria.where("_id").is(m.get("id")));
		Update update = new BasicUpdate(new Document().append("$set", new Document().append("reply", m.get("reply"))));
		
		mongoTemplate.updateMulti(query, update, "review");
	}

	public List<StoreVo> getStoreList() {
		return template.selectList("store.getStoreList" , null);
	}

	public boolean updateStore(StoreVo vo) {
		return template.update("store.storeUpdate", vo) == 1?true:false;
	}
	
}
