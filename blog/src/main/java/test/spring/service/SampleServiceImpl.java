package test.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.spring.component.SampleDTO;
import test.spring.mapper.SampleMapper;

@Service
public class SampleServiceImpl implements SampleService{

	@Autowired
	private SampleMapper mapper;
	
	@Override
	public List<SampleDTO> all(){
		return mapper.sampleList();
	}
}
