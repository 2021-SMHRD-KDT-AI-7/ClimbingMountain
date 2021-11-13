package Controller;

import java.util.ArrayList;
import java.util.Scanner;

import Model.DAO;
import Model.DTO;

public class test {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		DAO dao = new DAO();
		ArrayList<DTO> test_board = new ArrayList<>();

		while (true) {
			System.out.println("=======================================================================================");
			System.out.println("[1] test_table 에 데이터 추가 ,  [2] test_table 전체 확인 , [3] test_table test_String 컬럼 검색");
			System.out.println("=======================================================================================");
			int input = sc.nextInt();
			System.out.println("=======================================================================================");
			if (input == 1) { // 테이블 데이터 추가 
				System.out.println("test_String 에 넣을 단어 입력(String 형) >> ");
				String test_String = sc.next();
				System.out.println("=======================================================================================");
				System.out.println("test2_num 에 넣을 단어 입력(Int 형) >> ");
				int test2_num = sc.nextInt();
				System.out.println("=======================================================================================");
				
				int cnt = dao.upload(new DTO(test_String, test2_num));

	
				if (cnt > 0) {
					System.out.println("데이터 전송 성공");
				} else {
					System.out.println("데이터 전송 실패");
				}

			} else if (input == 2) {  // 테이블 전체 데이터 확인
				
				test_board = dao.getAlldate();
				for (int i = 0; i < test_board.size(); i++) {
					String c1 = test_board.get(i).getTest_String();
					int c2 = test_board.get(i).getTest2_num();
					System.out.println(i + 1 + "번 =  Test_String : " + c1 + " Test2_num :" + c2);
				}
				test_board.clear();
				
				
			} else if( input == 3 ){ // 테이블  test_String 컬럼 검색
				System.out.println("test_String 에서 검색할 단어 입력 >> ");
				String search = sc.next();
				System.out.println("=======================================================================================");
				test_board = dao.getSelect_test_String(search);
				for (int i = 0; i < test_board.size(); i++) {
					String c1 = test_board.get(i).getTest_String();
					int c2 = test_board.get(i).getTest2_num();
					System.out.println(i + 1 + "번 =  Test_String : " + c1 + " Test2_num : " + c2);
					
				}
				System.out.println("=======================================================================================");
				if(test_board.size()==0) {
					System.out.println("검색 결과가 존재하지 않습니다.");
				}
				test_board.clear();
			}else {
				System.out.println("번호를 잘못 입력하였습니다!");
			}
			
			
			
		}

	}

}
