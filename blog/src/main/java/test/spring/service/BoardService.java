package test.spring.service;

import java.util.List;

import test.spring.component.BoardDTO;

public interface BoardService {
	public List<BoardDTO> infoAll(BoardDTO dto);
	public void contentDel(int board_num);
	public void contentWrite(BoardDTO dto);
	public void contentModify(BoardDTO dto);
}
