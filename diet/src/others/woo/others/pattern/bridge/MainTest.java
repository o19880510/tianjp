package woo.others.pattern.bridge;

public class MainTest {
	public static void main(String[] args) {
		TVMaker tvMaker = new TVMakerPander();
		TV tv = new TV40(tvMaker);
		
		
		tv.view();
	}
}


// java.sql.DriverManager
// java.sql.Driver