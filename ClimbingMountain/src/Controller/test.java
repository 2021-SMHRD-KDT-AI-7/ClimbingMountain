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
		dao.getDate();

		while (true) {
			System.out.println("[1] test_table �� ������ �߰� ,  [2] test_table ������ Ȯ��");
			int input = sc.nextInt();

			if (input == 1) {
				System.out.println("test_String �� ���� �ܾ� �Է�(String ��) >> ");
				String test_String = sc.next();
				System.out.println("test2_num �� ���� �ܾ� �Է�(Int ��) >> ");
				int test2_num = sc.nextInt();
				int cnt = dao.upload(new DTO(test_String, test2_num));

				if (cnt > 0) {
					System.out.println("������ ���� ����");
				} else {
					System.out.println("������ ���� ����");
				}
				break;

			} else if (input == 2) {
				System.out.println(test_board.size());
				test_board = dao.getDate();
				System.out.println(test_board.size());
				for (int i = 0; i < test_board.size(); i++) {
					String c1 = test_board.get(i).getTest_String();
					int c2 = test_board.get(i).getTest2_num();
					System.out.println(i + 1 + "�� =  Test_String : " + c1 + " Test2_num :" + c2);
				}
				break;
			} else {
				System.out.println("��ȣ�� �߸� �Է��Ͽ����ϴ�!");
			}
		}

	}

}
