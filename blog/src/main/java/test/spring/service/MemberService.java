package test.spring.service;

import java.util.List;

import test.spring.component.GuestBookDTO;
import test.spring.component.MemberDTO;

public interface MemberService {

	public int loginCheck(String id, String pw);
	
	public MemberDTO memberAll(String id);
	
	public void inputPro(MemberDTO dto);
	
	public void updatePro(MemberDTO dto);
	
	public void testBoardPro(GuestBookDTO dto);
	
	public List<GuestBookDTO> testList(int start, int end);
	
	public int count();
}
