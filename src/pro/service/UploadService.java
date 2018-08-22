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

	public AddMenuVo execute(MultipartFile file, String store) throws Exception {
		
		File dir = new File(ctx.getRealPath("/image"),store);
		
		System.out.println(ctx.getRealPath("/image"));
		
		if (!dir.exists())
			dir.mkdirs();

		File dest = new File(dir, file.getOriginalFilename());

		file.transferTo(dest);

		AddMenuVo vo = new AddMenuVo();
		vo.setFile_name(file.getOriginalFilename());
		vo.setFile_url("/image/"+store+"/"+file.getOriginalFilename());
		
		return vo;
	}
}