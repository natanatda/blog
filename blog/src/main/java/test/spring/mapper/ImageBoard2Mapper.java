package test.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import test.spring.component.Img_Board2DTO;

public interface ImageBoard2Mapper {
	public List<Img_Board2DTO> getList(@Param("start")int start, @Param("end")int end);
	public int countList();
	public void writeBoard(Img_Board2DTO dto);
	public int deleteBoard(int num);
	public Img_Board2DTO getBoard(int num);
	public int updateBoard(Img_Board2DTO dto);
}
