package book;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.checkerframework.checker.units.qual.A;

import java.util.Date;

@Getter
@AllArgsConstructor
public class BookRequestDTO {
    private Date bdate;
    private int cancelYn;
    private Date cdate;
    private long memberSeq;
    private long boardSeq;
}
