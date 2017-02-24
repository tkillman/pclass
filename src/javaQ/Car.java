package javaQ;


class Car{
	 protected int speed;	//자동차 속도
	 protected String name;
	
	public Car(){}
	 
	 public Car(String carName){
		 this.name = carName;
	 }
	
	 //- speedUp    void	없음	  public 자동차 속도 1증가
	public void speedUp(){
		this.speed +=1;
	}
	 
	public void speedDown(){
		this.speed -=1;
	}
	
	public void stop(){
		this.speed =0;
	}
	
	public void display(){
		System.out.println(speed + " , " + name);
	}
	
	
}








/**클래스 이름  : Car
*멤버변수 : protected int speed	//자동차 속도
	   protected String name//자동차 이름

*생성자  작성
-모든 멤버변수를 0 또는 null 로 초기화 하는 생성자
-자동자의 이름을 매개변수로 받아 초기화 하는 생성자

*메소드 작성
메소드명   리턴타입  매개변수 접근제어자 용도
- speedUp    void	없음	  public 자동차 속도 1증가
- speedDown  void	없음	  public 자동차 속도 1감소
- stop	     void	없음	  public 자동차 속도 0 설정
- display    void	없음	  public 자동자이름, 속도 출력
*/