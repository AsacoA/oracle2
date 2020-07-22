package com.javalec.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.ex.dto.LDto;
import com.javalec.ex.dto.LMDto;

public class LDao {
DataSource dataSource;
	
	public LDao() {
		// TODO Auto-generated constructor stub
		/* �����ڿ��� BDCP�� �����.*/
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public ArrayList<LDto> bStatus(){
		ArrayList<LDto> dtos = new ArrayList<LDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		/*DBCP�κ��� Connection�� ���, �����ͺ��̽��� ���õ� �ʿ��� �۾�� �����Ѵ�.*/
		try {
			connection = dataSource.getConnection();
			
			String query = "SELECT * FROM vbStatus";
			preparedStatement = connection.prepareStatement(query);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				String bName = rs.getString("å�̸�");
				String bType = rs.getString("å�帣");
				String rDate = rs.getString("�뿩��¥");
				String mName = rs.getString("�뿩ȸ��");
				System.out.printf("bName: %10s, Jarn: %10s, rDate: %10s, mName: %10s%n", 
						bName, bType, rDate, mName);
				LDto dto = new LDto(bName, bType, rDate, mName);
				dtos.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}
	
	public void bRegister(String bName, String type) {
		// TODO Auto-generated method stub
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into tb_book values (seq_book.NEXTVAL, ?, ?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, bName);
			preparedStatement.setString(2, type);
			
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	}

	public ArrayList<LMDto> mList(){
		ArrayList<LMDto> dtos = new ArrayList<LMDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		/*DBCP�κ��� Connection�� ���, �����ͺ��̽��� ���õ� �ʿ��� �۾�� �����Ѵ�.*/
		try {
			connection = dataSource.getConnection();
			
			String query = "SELECT name n, tel t FROM tb_member";
			preparedStatement = connection.prepareStatement(query);
			rs = preparedStatement.executeQuery();
			System.out.println("DAO");
			while (rs.next()) {
				String mName = rs.getString("n");
				String mTel = rs.getString("t");				
				LMDto dto = new LMDto(mName, mTel, 0);
				//System.out.printf("name: %15s, tel: %s%n", mName,  mTel);
				dtos.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}
}
