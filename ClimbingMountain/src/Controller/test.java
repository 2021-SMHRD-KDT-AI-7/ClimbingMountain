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
			System.out.println("[1] test_table �� ������ �߰� ,  [2] test_table ��ü Ȯ�� , [3] test_table test_String �÷� �˻�");
			System.out.println("=======================================================================================");
			int input = sc.nextInt();
			System.out.println("=======================================================================================");
			if (input == 1) { // ���̺� ������ �߰� 
				System.out.println("test_String �� ���� �ܾ� �Է�(String ��) >> ");
				String test_String = sc.next();
				System.out.println("=======================================================================================");
				System.out.println("test2_num �� ���� �ܾ� �Է�(Int ��) >> ");
				int test2_num = sc.nextInt();
				System.out.println("=======================================================================================");
				
				int cnt = dao.upload(new DTO(test_String, test2_num));

	
				if (cnt > 0) {
					System.out.println("������ ���� ����");
				} else {
					System.out.println("������ ���� ����");
				}

			} else if (input == 2) {  // ���̺� ��ü ������ Ȯ��
				
				test_board = dao.getAlldate();
				for (int i = 0; i < test_board.size(); i++) {
					String c1 = test_board.get(i).getTest_String();
					int c2 = test_board.get(i).getTest2_num();
					System.out.println(i + 1 + "�� =  Test_String : " + c1 + " \t Test2_num :" + c2);
				}
				test_board.clear();
			} else if( input == 3 ){ // ���̺�  test_String �÷� �˻�
				System.out.println("test_String ���� �˻��� �ܾ� �Է� >> ");
				String search = sc.next();
				System.out.println("=======================================================================================");
				test_board = dao.getSelect_test_String(search);
				for (int i = 0; i < test_board.size(); i++) {
					String c1 = test_board.get(i).getTest_String();
					int c2 = test_board.get(i).getTest2_num();
					System.out.println(i + 1 + "�� =  Test_String : " + c1 + "  \t Test2_num :" + c2);
				}
				if(test_board.size()==0) {
					System.out.println("�˻� ����� �������� �ʽ��ϴ�.");
				}
				test_board.clear();
			}else {
				System.out.println("��ȣ�� �߸� �Է��Ͽ����ϴ�!");
			}
			
			
		}

	}

}
