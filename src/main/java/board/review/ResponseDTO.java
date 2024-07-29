package board.review;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.List;

@AllArgsConstructor
@Getter
public class ResponseDTO<E> {
  private List<E> dto;
  private int count;
  private double average;
}
