package pds.model;

//정말 파일에 필요한 내용만 저장한 것
public class AddRequest {
	
	private String fileName; 
	private long fileSize;
	private String realPath;
	private String description;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getRealPath() {
		return realPath;
	}

	public void setRealPath(String realPath) {
		this.realPath = realPath;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	//PdsItem 처리
	public PdsItem toPdsItem() {
		PdsItem item = new PdsItem();
		item.setFileName(fileName);
		item.setFileSize(fileSize);
		item.setRealPath(realPath);
		item.setDescription(description);
		return item;
	}

}