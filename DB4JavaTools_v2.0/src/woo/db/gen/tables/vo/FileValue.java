package woo.db.gen.tables.vo;

public class FileValue {
	
	private String	fileName;
	private String	fileContent;
	
	
	public FileValue(String fileName, String fileContent) {
		this.fileName = fileName;
		this.fileContent = fileContent;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileContent() {
		return fileContent;
	}

	public void setFileContent(String fileContent) {
		this.fileContent = fileContent;
	}

	@Override
	public String toString() {
		return "FileValue [fileName=" + fileName + ", fileContent="
				+ fileContent + "]";
	}
}
