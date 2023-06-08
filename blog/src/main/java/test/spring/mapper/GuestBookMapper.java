package test.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import test.spring.component.GuestBookDTO;

public interface GuestBookMapper {

	public void insert(GuestBookDTO dto);
	
	public List<GuestBookDTO> guestList(@Param("start")int start, @Param("end")int end);
	
	public int count();
}
