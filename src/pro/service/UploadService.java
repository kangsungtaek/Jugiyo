package pro.service;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import pro.vo.MenuVo;

@Service
public class UploadService {
	@Autowired
	ServletContext ctx;

	public MenuVo execute(MultipartFile file, String store) throws Exception {
		
		File dir = new File(ctx.getRealPath("/image"),store);
		
		System.out.println(ctx.getRealPath("/image"));
		
		if (!dir.exists())
			dir.mkdirs();

		File dest = new File(dir, file.getOriginalFilename());

		file.transferTo(dest);

		MenuVo vo = new MenuVo();
		vo.setFileName(file.getOriginalFilename());
		vo.setFileUrl("/image/"+store+"/"+file.getOriginalFilename());
		
		
		return vo;
	}
}