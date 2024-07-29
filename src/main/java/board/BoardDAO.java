package board;

import java.sql.Connection;
import java.sql.SQLException;

import dbutil.BaseDAO;

public class BoardDAO extends BaseDAO {
  private Connection con;

  public BoardDAO() {
    try {
      con = getConnection();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }


}
