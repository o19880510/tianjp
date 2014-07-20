package woo.framework.core.transactional;

public enum Propagation {
	REQUIRED(0), REQUIRES_NEW(1), NOT_SUPPORTED(2);

	private final int	value;

	private Propagation(int value) {
		this.value = value;
	}

	public int value() {
		return this.value;
	}

}
