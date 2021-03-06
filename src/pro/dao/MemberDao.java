package pro.dao;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bson.Document;
import org.bson.types.ObjectId;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.BasicUpdate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import pro.vo.CouponVo;
import pro.vo.LogVo;
import pro.vo.MemberVo;
import pro.vo.MultiCouponVo;
import pro.vo.ReviewVo;

@Repository
public class MemberDao {

	@Autowired
	MongoTemplate mongoTemplate;
	@Autowired
	SqlSessionTemplate template;
	
	//로그인에 필요한 함수, 아이디를 통해서 vo를 불러오는 작업
	public MemberVo findById(Map map) {
		return template.selectOne("member.findById", map);
		//member가 mapper이름 findById는 sql문 이름
	}
	
	//모든회원 불러오는 작업
	public List<MemberVo> getAll() {
		return template.selectList("member.getAll");
	}
	
	//회원가입용 함수
	public int addMember(MemberVo vo) {
		return template.insert("member.addMember", vo);
	}
	
	//아이디 중복체크용 함수
	public List<String> findAll() {
		return template.selectList("member.findAll");  // mapper이름==member이고, .findAll은 sql문 이름을 말함.
	}
	//주문내역불러오기
	public List<LogVo> readAllById(String id) {
		Query query = new BasicQuery(new Document().append("userId", id));
		List<LogVo> list = mongoTemplate.find(query, LogVo.class, "log");
		list.sort(new Comparator<LogVo>() {

			@Override
			public int compare(LogVo o1, LogVo o2) {
				return o1.getOrderdate().compareTo(o2.getOrderdate()) * (-1);
			}
		});
		return list;
	}
	
	//특정 주문내역 불러오기
	public LogVo readByObjectId(String id) {
		Query query = new BasicQuery(new Document().append("_id", new ObjectId(id)));
		return mongoTemplate.findOne(query, LogVo.class, "log");
	}
	
	//내집주소 등록
	public void addAddr(Map map) {
		template.update("member.addAddr", map);
	}
	
	//리뷰등록
	public void addReview(Map map) {
		mongoTemplate.insert(map, "review");
	}
	
	//리뷰등록시 log에 update해둘 함수
	public void updateLogReviewd(String logId) {
		Query query = new BasicQuery(new Document().append("_id", new ObjectId(logId)));
		Update update = new BasicUpdate(new Document().append("$set", new Document().append("reviewd", "Y")));
		
		mongoTemplate.updateMulti(query, update, "log");
	}
	
	//사용자가 작성한 리뷰불러오기
	public ReviewVo findReivewByLogId(String logId) {
		Query query = new BasicQuery(new Document().append("logId", logId));
		return mongoTemplate.findOne(query, ReviewVo.class, "review");
	}
	
	//주문후 포인트 적립
	public void updatePoint(Map map) {
		template.update("member.updatePoint", map);
	}
	
	//주문갯수에 따른 등급조정
	public void updateGrade(Map map) {
		template.update("member.updateGrade", map);
	}
	
	//등급에 따른 쿠폰가져오기
	public List<CouponVo> getCoupon(int grade) {
		return template.selectList("member.getCoupon", grade);
	}
	
	//사용자의 쿠폰 넣어두기
	public void insertCoupon(Map map) {
		mongoTemplate.insert(map, "coupon");
	}
	
	//사용자의 등급조정시 쿠폰 넣어주기
	public void updateCoupon(Map map) {
		Query query = new BasicQuery(new Document().append("userId", map.get("userId")));
		Update update = new BasicUpdate(new Document().append("$push", new Document().append("coupons", map.get("coupons"))));
		mongoTemplate.updateFirst(query, update, "coupon");
	}
	
	//사용자의 사용가능한 쿠폰 가져오기
	public MultiCouponVo findCoupon(String id) {
		Query query = new BasicQuery(new Document().append("userId", id));
		return mongoTemplate.findOne(query, MultiCouponVo.class, "coupon");
	}
	
	//사용한 쿠폰 업데이트
	public void usedCoupon(Map map) {
		Query query = new BasicQuery(new Document().append("userId", map.get("userId")));
		Update update = new BasicUpdate(new Document().append("$pull", 
				new Document().append("coupons", new Document().append("_id", map.get("c")))));
		mongoTemplate.updateFirst(query, update, "coupon");
	}

}
