package test.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.spring.component.SampleDTO;
import test.spring.mapper.ImgBoard1Mapper;



@Service
public class ImgBoard1ServiceImpl implements ImgBoard1Service{
	
	@Autowired
	private ImgBoard1Mapper mapper;
	
	@Override
	public List<SampleDTO> getArticles(){
		return mapper.getArticles();
	}
}
