package woo.others.pattern.bridge;

public abstract class TV {
	protected TVMaker maker;
	
	public TV(TVMaker maker) {
		this.maker = maker;
	}

	public abstract void view();
}
