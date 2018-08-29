package pro.vo;

public class ReviewVo {
	String id;
	int no;
	String nickname;
	double star;
	String content;
	String[] img; //이미지주소
	String reply;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public double getStar() {
		return star;
	}
	public void setStar(double star) {
		this.star = star;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String[] getImg() {
		return img;
	}
	public void setImg(String[] img) {
		this.img = img;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	
	@Override
	public String toString() {
		return "ReviewVo [id=" + id + ",no=" + no + ", nickname=" + nickname + ", star=" + star + ", content=" + content + ", img="
				+ img + ", reply=" + reply + "]";
	}
}
