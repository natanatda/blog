package test.spring.mapper;

import java.util.List;

import test.spring.component.BoardDTO;

public interface BoardMapper {
	public List<BoardDTO> listAll(String id);
}
