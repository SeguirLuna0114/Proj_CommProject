package music.model;

import java.util.Date;

import lombok.Data;

@Data
public class UserInfoVO {
	private int pr_no;	
	private String user_id;
	private String pr_sub;
	private String pr_text;
	private int pr_readcount;
	private String pr_major;
	private String pr_loc;
	private String pr_career;
	private String pr_file;
	private String pr_video;
	private String pr_hash;
	private Date pr_date;
	private Date pr_update;
	private String pr_delete;
	
	// lombok사용 시, getter & setter메소드 불필요함 => 어노테이션 사용
}