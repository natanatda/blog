package test.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.spring.component.BoardDTO;
import test.spring.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;

	@Override
	public List<BoardDTO> infoAll(BoardDTO dto) {
		return mapper.infoAll(dto);
	}

	@Override
	public void contentDel(int board_num) {
		mapper.contentDel(board_num);
	}

	
	@Override
	public void contentWrite(BoardDTO dto) {
		mapper.contentWrite(dto);
	}

	@Override
	public void contentModify(BoardDTO dto) {
		mapper.contentModify(dto);
	}
	
}
