package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class ReplyMapperTests {
	
	@Autowired
	private ReplyMapper mapper;
	
	private Long[] bnoArr = {10000L, 10001L, 10002L, 10003L, 10004L};
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	/*@Test
	public void testCreate() {
		IntStream.rangeClosed(1, 10).forEach(i->{
			ReplyVO vo = new ReplyVO();
			vo.setBno(bnoArr[i%5]);
			vo.setReply("´ñ±Û Å×½ºÆ®"+i);
			vo.setReplyer("replyer"+i);
			
			mapper.insert(vo);
		});
	}*/
	
	/*
	 * @Test public void testRead() {
	 * 
	 * Long targetRno = 1L; ReplyVO vo = mapper.read(targetRno); log.info(vo); }
	 */
	
	/*@Test
	public void testDelete() {
		Long targetRno = 1L;
		mapper.delete(targetRno);
		
	}*/
	
	
	
	/*@Test
	public void testUpdate() {
		Long targetRno = 1L;
		ReplyVO vo = mapper.read(targetRno);
		vo.setReply("Update Reply ");
		int count = mapper.update(vo);
		log.info("Update Count : "+count);
		
	}*/
	
	/*@Test
	public void testList() {
		Criteria cri = new Criteria();
		List<ReplyVO> list = mapper.getListWithPaging(cri, bnoArr[0]);
		list.forEach(reply -> log.info(list));
	}*/
	
	@Test
	public void testList2() {
		Criteria cri = new Criteria(2,10);
		List<ReplyVO> list = mapper.getListWithPaging(cri, 30061L);
		list.forEach(reply -> log.info(reply));
	}
	
	
}
