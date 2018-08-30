package pro.vo;

import java.io.Serializable;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class MenuVo implements Serializable {
	int no;
	String name;
	int price;
	int store;
	String fileUri;
	String fileName;
	int type;
	
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	MultipartFile[] attach;

	// 강성택 메뉴 카운트 추가
	int cnt;

	
	public MultipartFile[] getAttach() {
		return attach;
	}

	public void setAttach(MultipartFile[] attach) {
		this.attach = attach;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getStore() {
		return store;
	}

	public void setStore(int store) {
		this.store = store;
	}

	public String getFileUri() {
		return fileUri;
	}

	public void setFileUri(String fileUri) {
		this.fileUri = fileUri;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
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

	@Override
	public String toString() {
		return "MenuVo [no=" + no + ", name=" + name + ", price=" + price + ", store=" + store + ", fileUri=" + fileUri
				+ ", fileName=" + fileName + ", type=" + type + ", attach=" + Arrays.toString(attach) + ", cnt=" + cnt
				+ "]";
	}
	
}
