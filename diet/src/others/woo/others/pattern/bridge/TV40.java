package woo.others.pattern.bridge;

public class TV40 extends TV{

	public TV40(TVMaker maker) {
		super(maker);
	}

	public void view(){
		maker.produce();
		System.out.println("40 inch.");
	}
}
