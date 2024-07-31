package book;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class BookResponseDTO {
    private int totalBookLimit;
    private int bookCnt;
}