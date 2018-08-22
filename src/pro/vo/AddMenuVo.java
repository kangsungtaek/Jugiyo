package pro.vo;

import java.io.File;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class AddMenuVo {
	int no;
	String name;
	int price;
	String store;
	MultipartFile[] file;
	String file_name;
	String file_url;
	List<AddMenuVo> list;
	
	
	public List<AddMenuVo> getList() {
		return list;
	}
	public void setList(List<AddMenuVo> list) {
		this.list = list;
	}
	public MultipartFile[] getFile() {
		return file;
	}
	public void setFile(MultipartFile[] file) {
		this.file = file;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_url() {
		return file_url;
	}
	public void setFile_url(String file_url) {
		this.file_url = file_url;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}
	@Override
	public String toString() {
		return "AddMenuVo [no=" + no + ", name=" + name + ",file="+file.toString()+", price=" + price + ", store=" + store + ", file_name="
				+ file_name + ", file_url=" + file_url + "]";
	}
}
