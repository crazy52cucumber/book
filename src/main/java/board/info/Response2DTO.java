package board.info;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Response2DTO {
	private InfoResponseDTO dto;
	private double avg;
	private int cnt;
}