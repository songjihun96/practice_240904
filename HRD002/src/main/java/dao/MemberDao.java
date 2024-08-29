package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBUtils;
import vo.MemberVO;

public class MemberDao {
	public ArrayList<MemberVO> getList(){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					"select		userid, \r\n"
					+ " username, \r\n"
					+ " SUBSTR(jumin, 1, 2) || '-' || SUBSTR(jumin, 3, 2) || '-' || SUBSTR(jumin, 5, 2) jumin, \r\n"
					+ " decode(gender, '1', '남', '2', '여') gender, \r\n"
					+ " address, \r\n"
					+ " decode(jobcd, '1', '학생', '2', '회사원', '3', '공무원', '4', '군인', '5', '기타') jobcd, \r\n"
					+ " decode(mailrcv, 'Y', '수신함', 'N', '수신하지않음') mailrcv, \r\n"
					+ " intro\r\n"
					+ "FROM MEMBER_2024");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setUserid(rs.getString("userid"));
				vo.setUsername(rs.getString("username"));
				vo.setJumin(rs.getString("jumin"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
				vo.setJobcd(rs.getString("jobcd"));
				vo.setMailrcv(rs.getString("mailrcv"));
				vo.setIntro(rs.getString("intro"));
				list.add(vo);
			}
			rs.close();
			ps.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<MemberVO> getSearch(String choice, String find){
		
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					"select userid, \r\n"
					+ " username, \r\n"
					+ " SUBSTR(jumin, 1, 2) || '-' || SUBSTR(jumin, 3, 2) || '-' || SUBSTR(jumin, 5, 2) jumin, \r\n"
					+ " decode(gender, '1', '남', '2', '여') gender, \r\n"
					+ " decode(jobcd, '1', '학생', '2', '회사원', '3', '공무원', '4', '군인', '5', '기타') jobcd\r\n"
					+ " FROM MEMBER_2024"
					+ " WHERE " + choice + " like ?");
			ps.setString(1, "%"+find+"%");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setUserid(rs.getString("userid"));
				vo.setUsername(rs.getString("username"));
				vo.setJumin(rs.getString("jumin"));
				vo.setGender(rs.getString("gender"));
				vo.setJobcd(rs.getString("jobcd"));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(list);
		return list;
		
	}
	public int input(MemberVO vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					" insert into MEMBER_2024"
					+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setString(1, vo.getUserid());
			ps.setString(2, vo.getUsername());
			ps.setString(3, vo.getPasswd());
			ps.setString(4, vo.getJumin());
			ps.setString(5, vo.getGender());
			ps.setString(6, vo.getAddress());
			ps.setString(7, vo.getJobcd());
			ps.setString(8, vo.getMailrcv());
			ps.setString(9, vo.getIntro());
			
			n = ps.executeUpdate();
			
			ps.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public MemberVO listOne(String userid) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		MemberVO vo = new MemberVO();
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(" select * "
					+ " from MEMBER_2024 "
					+ " where userid = ?");
			ps.setString(1, userid);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				vo.setUserid(rs.getString(1));
				vo.setUsername(rs.getString(2));
				vo.setPasswd(rs.getString(3));
				vo.setJumin(rs.getString(4));
				vo.setGender(rs.getString(5));
				vo.setAddress(rs.getString(6));
				vo.setJobcd(rs.getString(7));
				vo.setMailrcv(rs.getString(8));
				vo.setIntro(rs.getString(9));
			}
			ps.close();
			con.close();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return vo;
	}
	public int update(MemberVO vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					" update member_2024 set "
					+ " username = ?, "
					+ " passwd = ?, "
					+ " jumin = ?, "
					+ " gender = ?, "
					+ " address = ?, "
					+ " jobcd = ?, "
					+ " mailrcv = ?, "
					+ " intro = ? "
					+ " where userid = ? "
					);
			ps.setString(1, vo.getUsername());
			ps.setString(2, vo.getPasswd());
			ps.setString(3, vo.getJumin());
			ps.setString(4, vo.getGender());
			ps.setString(5, vo.getAddress());
			ps.setString(6, vo.getJobcd());
			ps.setString(7, vo.getMailrcv());
			ps.setString(8, vo.getIntro());
			ps.setString(9, vo.getUserid());
			
			n = ps.executeUpdate();
			
			ps.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	public int delete(String userid) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					"delete from member_2024 "
					+ " where userid = ? "
					);
			ps.setString(1, userid);
			n = ps.executeUpdate();
			
			ps.close();
			con.close();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return n;
	}
}
