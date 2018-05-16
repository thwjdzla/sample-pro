package kr.co.hta.board.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.hta.board.vo.Board;

import static org.hamcrest.CoreMatchers.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:/META-INF/spring/test-root-context.xml")
public class BoardServiceTest {
	
	@Autowired
	BoardService boardService;
	
	@Test
	public void testConfig() {
		assertThat(boardService, notNullValue());
	}
	
	@Test
	public void testGetAllBoards() {
		List<Board> boards = boardService.getAllBoards();
		
		assertThat(boards.size(), is(4));
	}
	
	@Test
	public void testGetBoardDetail() {
		Board board = boardService.getBoardDetail(162);
		
		assertThat(board, notNullValue());
	}
	

}
