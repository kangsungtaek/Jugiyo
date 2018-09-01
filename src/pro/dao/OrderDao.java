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
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import pro.vo.LogVo;

@Repository
public class OrderDao {

	@Autowired
	SqlSessionTemplate template;
	@Autowired
	MongoTemplate mongoTemplate;
	
	public List<LogVo> findLog(String id) {
		System.out.println("[orderDao:mongo]");
		Calendar cal = new GregorianCalendar();
	    cal.add(Calendar.DATE, -2);
		Query query = new BasicQuery(new Document().append("userId", id).append("date", new Document().append("$gte", cal.getTime())));
		
		System.out.println("[orderDao:mongo] " + query);
		
		return mongoTemplate.find(query, LogVo.class, "log");
	}
	
	//스토어 메뉴뽑기
	public List<LogVo> findStore (int no){
		Query query = new BasicQuery(new Document().append("storeNo", no));
		return mongoTemplate.find(query, LogVo.class, "log");
	}
	//스토어 당일 날짜 뽑기
	public List<LogVo> today(int no){
		long time = System.currentTimeMillis();
		time -= time%(1000L*60*60*24);
		Date d = new Date(time);
		
		Query query = new BasicQuery(new Document().append("storeNo", no).append("orderdate", new Document().append("$gte",d)));
		System.out.println("mongo"+query);
		return mongoTemplate.find(query, LogVo.class,"log");
	}
	
	public void insertLog(Map data) {
		mongoTemplate.insert(data, "log");
	}
	//딜리버리 업데이트
	public void updateDelivery(String logId){
		Query query = new BasicQuery(new Document().append("_id", new ObjectId(logId)));
		Update update = new BasicUpdate(new Document().append("$set", new Document().append("delivery", "Y")));
		mongoTemplate.updateMulti(query, update, "log");
	}
	
}
