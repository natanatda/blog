package test.spring.component;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardDTO {
	private int board_num;
	private String id;
	private String subject;
    private String content;
    private Timestamp reg;
    private int view_count;
}
