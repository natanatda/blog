package test.spring.service;

import java.util.List;

import test.spring.component.MemberDTO;

public interface MemberService {

	public int loginCheck(String id, String pw);
	
	public MemberDTO memberAll(String id);
	
	public void inputPro(MemberDTO dto);
	
	public void updatePro(MemberDTO dto);
}
