package test.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.spring.component.Img_Board2DTO;
import test.spring.mapper.ImageBoard2Mapper;

@Service
public class ImageBoard2ServiceImpl implements ImageBoard2Service {
	
	@Autowired
	private ImageBoard2Mapper mapper;

	@Override
	public List<Img_Board2DTO> getList(int start, int end) {
		return mapper.getList(start, end);
	} 

	@Override
	public void writeBoard(Img_Board2DTO dto) {
		mapper.writeBoard(dto);
		return;
	}
	
	@Override
	public Img_Board2DTO getBoard(int num) {
		return mapper.getBoard(num);
	}

	@Override
	public int countList() {
		return mapper.countList();
	}
	@Override
	public int deleteBoard(int num) {
		return mapper.deleteBoard(num);
	}
	@Override
	public int updateBoard(Img_Board2DTO dto) {
		return mapper.updateBoard(dto);
	}
	
}
