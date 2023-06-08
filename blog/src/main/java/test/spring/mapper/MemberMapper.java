package test.spring.mapper;

import org.apache.ibatis.annotations.Param;

import test.spring.component.MemberDTO;

public interface MemberMapper {

	public int loginCheck(@Param("id") String id, @Param("pw") String pw);
	
	public MemberDTO memberAll(String id);
	
	public void inputPro(MemberDTO dto);
	
	public void updatePro(MemberDTO dto);
}
