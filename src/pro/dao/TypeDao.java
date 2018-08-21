package pro.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pro.vo.TypeVo;

@Repository
public class TypeDao {
	
	@Autowired
	SqlSessionTemplate template;
	
	public List<TypeVo> getAll() {
		return template.selectList("type.getAll");
	}
}
