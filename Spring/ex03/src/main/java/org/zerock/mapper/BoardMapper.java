package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

@Repository(value="boardMapper")
public interface BoardMapper {
	public List<BoardVO> getList();
	public List<BoardVO> getListWithPaging(Criteria criteria);
	public void insert(BoardVO board);
	public void insertSelectKey(BoardVO board);
	public BoardVO read(Long bno);
	public int update(BoardVO board);
	public int delete(Long bno);
	public int getTotalCount(Criteria cri);
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
}
