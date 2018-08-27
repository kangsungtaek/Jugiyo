package pro.vo;

public class MenuAttachVo {
	int no;
	String uri;
	String name;
	int parent;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUri() {
		return uri;
	}
	public void setUri(String uri) {
		this.uri = uri;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	@Override
	public String toString() {
		return "MenuAttachVo [no=" + no + ", uri=" + uri + ", name=" + name + ", parent=" + parent + "]";
	}
    
}
