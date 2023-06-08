package test.spring.mapper;

import java.util.List;

import test.spring.component.GuestBookDTO;

public interface GuestBookMapper {

	public void insert(GuestBookDTO dto);
	
	public List<GuestBookDTO> guestList();
}
