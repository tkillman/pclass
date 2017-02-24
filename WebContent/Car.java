package day0126;


class Car{
	 protected int speed;	//�ڵ��� �ӵ�
	 protected String name;
	
	
	 public Car(String carName){
		 this.name = carName;
	 }
	
	 //- speedUp    void	����	  public �ڵ��� �ӵ� 1����
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








/**Ŭ���� �̸�  : Car
*������� : protected int speed	//�ڵ��� �ӵ�
	   protected String name//�ڵ��� �̸�

*������  �ۼ�
-��� ��������� 0 �Ǵ� null �� �ʱ�ȭ �ϴ� ������
-�ڵ����� �̸��� �Ű������� �޾� �ʱ�ȭ �ϴ� ������

*�޼ҵ� �ۼ�
�޼ҵ��   ����Ÿ��  �Ű����� ���������� �뵵
- speedUp    void	����	  public �ڵ��� �ӵ� 1����
- speedDown  void	����	  public �ڵ��� �ӵ� 1����
- stop	     void	����	  public �ڵ��� �ӵ� 0 ����
- display    void	����	  public �ڵ����̸�, �ӵ� ���
*/