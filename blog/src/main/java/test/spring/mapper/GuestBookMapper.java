package test.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import test.spring.component.GuestBookDTO;

public interface GuestBookMapper {

	public void insert(GuestBookDTO dto);
	
	public List<GuestBookDTO> guestList(@Param("start")int start, @Param("end")int end);
	
	public int count();
	
	public void update(@Param("subject")String subject, @Param("num")int num);
	
	public void delete(int num);
}
