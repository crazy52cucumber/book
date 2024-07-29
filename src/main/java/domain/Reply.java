package domain;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Setter
@Getter
public class Reply {
    private int replay_seq;
    private int rate;
    private String content;
    private Date cdate;
    private int member_seq;
    private int board_seq;
    private int valid;

    public Reply(int replay_seq, int rate, String content, Date cdate, int member_seq, int board_seq, int valid) {
        this.replay_seq = replay_seq;
        this.rate = rate;
        this.content = content;
        this.cdate = cdate;
        this.member_seq = member_seq;
        this.board_seq = board_seq;
        this.valid = valid;
    }

}
