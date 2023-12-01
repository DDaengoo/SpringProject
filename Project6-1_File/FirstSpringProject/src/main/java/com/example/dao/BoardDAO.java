package com.example.dao;

import com.example.bean.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class BoardDAO {
    @Autowired
    JdbcTemplate jdbcTemplate;
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String BOARD_INSERT = "insert into Smanagement (category, workname, workplace, deadline, note) values (?,?,?,?,?)";
    private final String BOARD_UPDATE = "update Smanagement set category=?, workname=?, workplace=?, deadline=?, note=? where seq=?";

    private final String BOARD_DELETE = "delete from Smanagement  where seq=?";
    private final String BOARD_GET = "select * from Smanagement  where seq=?";
    private final String BOARD_LIST = "select * from Smanagement order by seq desc";

    public int insertBoard(BoardVO vo) {
        String sql = "insert into Smanagement(category, workname, workplace, deadline, note) values ("
                +"'" + vo.getCategory() + "',"
                +"'" + vo.getWorkname() + "',"
                +"'" + vo.getWorkplace() + "',"
                +"'" + vo.getDeadline() + "',"
                +"'" + vo.getNote() + "')";
        return jdbcTemplate.update(sql);
    }

    public int deleteBoard(int seq){
        String sql = "delete from Smanagement where seq = " + seq;
        return jdbcTemplate.update(sql);
    }

    public int updateBoard(BoardVO vo){
        String sql = "update Smanagement set category ='" + vo.getCategory() +"',"
                + " workname ='" + vo.getWorkname() + "',"
                + " workplace='" + vo.getWorkplace() +"',"
                + " deadline='" + vo.getDeadline() + "',"
                + " note='" + vo.getNote() + "' where seq=" + vo.getSeq();
        return jdbcTemplate.update(sql);
    }

    class BoardRowMapper implements RowMapper <BoardVO>{
        @Override
        public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
            BoardVO vo = new BoardVO();
            vo.setSeq(rs.getInt("seq"));
            vo.setCategory(rs.getString("category"));
            vo.setWorkname(rs.getString("workname"));
            vo.setWorkplace(rs.getString("workplace"));
            vo.setDeadline(rs.getString("deadline"));
            vo.setNote(rs.getString("note"));
            vo.setRegdate(rs.getDate("regdate"));
            return vo;
        }
    }

    public BoardVO getBoard(int seq){
        String sql = "select * from Smanagement where seq=" + seq;
        return jdbcTemplate.queryForObject(sql, new BoardRowMapper());
    }

    public List<BoardVO> getBoardList(){
        String sql = "select * from Smanagement order by regdate desc";
        return jdbcTemplate.query(sql, new BoardRowMapper());
    }
}

