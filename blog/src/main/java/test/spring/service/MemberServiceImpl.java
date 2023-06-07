package test.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.spring.component.MemberDTO;
import test.spring.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public int loginCheck(String id, String pw) {
		return mapper.loginCheck(id, pw);		
	};
	
	@Override
	public MemberDTO memberAll(String id) {
		return mapper.memberAll(id);
	};
	
	@Override
	public void inputPro(MemberDTO dto) {
		mapper.inputPro(dto);
	};
	
	@Override
	public void updatePro(MemberDTO dto) {
		mapper.updatePro(dto);
	};
}
