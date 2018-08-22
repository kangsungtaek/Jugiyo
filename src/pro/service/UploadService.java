package pro.service;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import pro.vo.AddMenuVo;

@Service
public class UploadService {
	@Autowired
	ServletContext ctx;

	public AddMenuVo execute(MultipartFile file) throws Exception {
		File dir = new File(ctx.getRealPath("/image"));
		if (!dir.exists())
			dir.mkdirs();

		File dest = new File(dir, file.getOriginalFilename());

		file.transferTo(dest);

		AddMenuVo vo = new AddMenuVo();
		//vo.setMenu_img();
		return vo;
	}
}