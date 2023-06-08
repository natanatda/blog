package test.spring.service;

import java.util.List;

import test.spring.component.ImgBoard1DTO;

public interface ImgBoard1Service {
	public List<ImgBoard1DTO> getArticles(int startRow, int endRow);
	public int getCount();
	public ImgBoard1DTO getArticle(int num);
	public void addReadcount(int num);
	
	public int getLastNum();
	public void insert(ImgBoard1DTO article);
	
	public void update(ImgBoard1DTO article);
	
	public void delete(int num);
}
