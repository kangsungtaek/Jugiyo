package pro.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pro.vo.AddMenuVo;

@Repository
public class AddMenuDao {
	@Autowired
	SqlSessionTemplate template;
	
	public boolean addMenu(AddMenuVo vo) {
		int r = template.insert("owner.addMenu",vo);
		System.out.println(r);
		return r==1;
	}
}
