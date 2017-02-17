package board;

import java.util.HashSet;
import java.util.Set;

public class lotto {

	
	public static void main(String[] args) {
		
		Set<Integer> sixNumber = new HashSet<>();
		
		
		while(sixNumber.size()<6){
			int x = (int)(Math.random()*45);
			if(x==0){
				continue;
			}
			sixNumber.add(x);
		}
		
		System.out.println(sixNumber);
		
	}
	
}
