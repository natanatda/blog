package test.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import test.spring.component.GuestBookDTO;
import test.spring.component.MemberDTO;

public interface MemberMapper {

	public int loginCheck(@Param("id") String id, @Param("pw") String pw);
	
	public MemberDTO memberAll(String id);
	
	public void inputPro(MemberDTO dto);
	
	public void updatePro(MemberDTO dto);
	
	public void testBoardPro(GuestBookDTO dto);
	
	public List<GuestBookDTO> testList(@Param("start") int start, @Param("end") int end);
	
	public int count();
}
