package javaQ;

class Taxi extends Car{

	private int charge; // 택시요금
	private boolean fare; // 할증여부
	private String company;

	public Taxi(String taxiCompany) {

		this.company = taxiCompany;

	}

	
	public void accounts(){
		
		if(fare){
		 charge = charge+(speed*12);
		} else{
		 charge = charge+(speed*10);
		}
		
	}
	
	public void setFare(boolean fare){
		this.fare= fare;
	}
	
	public void display(){
		StringBuffer str = new StringBuffer(company +" , "+ charge + " , ");
		
		if(fare){
			str.append("할증");
		} else {
			str.append("일반");
		}
		
		System.out.println(str);
		
		
	}

}