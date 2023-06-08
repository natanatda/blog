package test.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.spring.component.GuestBookDTO;
import test.spring.mapper.GuestBookMapper;

@Service
public class GuestBookServiceImpl implements GuestBookService{

	
	@Autowired
	private GuestBookMapper mapper;
	
	@Override
	public void insert(GuestBookDTO dto) {
		mapper.insert(dto);
	}
	
	@Override
	public List<GuestBookDTO> list(int start, int end){
		return mapper.guestList(start,end);
	}
	
	@Override
	public int count() {
		return mapper.count();
	}
	
	@Override
	public void update(String subject, int num) {
		mapper.update(subject, num);
	}
	
	@Override
	public void delete(int num) {
		mapper.delete(num);
	}
}
