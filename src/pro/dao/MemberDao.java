package pro.dao;

import java.util.List;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import pro.vo.LogVo;

@Repository
public class MemberDao {

	@Autowired
	MongoTemplate mongoTemplate;
	
	//주문내역불러오기
	public List<LogVo> readAllById(String id) {
		Query query = new BasicQuery(new Document().append("_id", id));
		return mongoTemplate.find(query, LogVo.class, "log");
	}
}
