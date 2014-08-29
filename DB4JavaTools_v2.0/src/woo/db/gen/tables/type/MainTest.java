package woo.db.gen.tables.type;

public class MainTest {
	
	public static void main(String[] args) {
		System.out.println(TypeTransferFactory.getType("varchar"));
		System.out.println(TypeTransferFactory.getType("VARCHAR"));
		System.out.println(TypeTransferFactory.getType("int", 0));
		System.out.println(TypeTransferFactory.getType("int", 1));
	}
}
