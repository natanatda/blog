package test.spring.service;

import java.util.List;

import test.spring.component.GuestBookDTO;

public interface GuestBookService {

	public void insert(GuestBookDTO dto);
	public List<GuestBookDTO> list();
}
