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
import pro.vo.StoreVo;

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
		Query query = new BasicQuery(new Document().append("_id", id).append("date", new Document().append("$gte", cal.getTime())));
		System.out.println("[orderDao:mongo] " + query);
		
		return mongoTemplate.find(query, LogVo.class, "log");
	}
	//스토어 메뉴뽑기
	public List<LogVo> findStore (String name){
		Query query = new BasicQuery(new Document().append("menuName", name));
		return mongoTemplate.find(query, LogVo.class, "log");
	}
	
	public void insertLog(Map data) {
		mongoTemplate.insert(data, "log");
	}
}
