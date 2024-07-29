package board.info;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class InfoResponseDTO {
	private String academyName;
	private String addr;
	private String phoneNum;
	private Date edate;
	private Date ldate;
	private String grade;
	private String subject;
	private String content;
	private int bookLimit;
}