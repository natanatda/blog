package test.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import test.spring.component.ImgBoard1DTO;

public interface ImgBoard1Mapper {
	// list
	public List<ImgBoard1DTO> getArticles(@Param("startRow") int startRow, 
									@Param("endRow") int endRow);
	// content
	public int getCount(); 
	public ImgBoard1DTO getArticle(int num);
	public void addReadcount(int num);
	
	//write
	public int getLastNum(); 
	public void insert(ImgBoard1DTO article);
	
	// update 
	public void update(ImgBoard1DTO article);
	
	// delete
	public void delete(int num);
}
