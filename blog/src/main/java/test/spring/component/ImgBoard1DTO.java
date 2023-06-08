package test.spring.component;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ImgBoard1DTO {
	private int img_board1_num;
	private String id;
	private String subject;
	private String content;
	private int readcount;
	private String ip;
	private Timestamp reg_date;
	private String img;
}
