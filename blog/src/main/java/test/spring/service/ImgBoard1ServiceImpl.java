package test.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.spring.component.ImgBoard1DTO;
import test.spring.component.SampleDTO;
import test.spring.mapper.ImgBoard1Mapper;



@Service
public class ImgBoard1ServiceImpl implements ImgBoard1Service{
	
	@Autowired
	private ImgBoard1Mapper mapper;
	
	@Override
	public List<ImgBoard1DTO> getArticles(int startRow, int endRow){
		return mapper.getArticles(startRow, endRow);
	}
	
	@Override
	public int getCount() {
		return mapper.getCount();
	}
	@Override
	public ImgBoard1DTO getArticle(int num) {
		return mapper.getArticle(num);
	}
	@Override
	public void addReadcount(int num) {
		mapper.addReadcount(num);
	}
	
	@Override
	public int getLastNum() {
		return mapper.getLastNum();
	}
	@Override
	public void insert(ImgBoard1DTO article) {
		mapper.insert(article);
	}
	
	@Override
	public void update(ImgBoard1DTO article) {
		mapper.update(article);
	}
	
	@Override
	public void delete(int num) {
		mapper.delete(num);
	}
}
