package test.spring.service;

import java.util.List;

import test.spring.component.BoardDTO;

public interface BoardService {
	public List<BoardDTO> listAll(String id);
}
