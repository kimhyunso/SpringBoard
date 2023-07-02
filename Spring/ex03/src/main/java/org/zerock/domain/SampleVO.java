package org.zerock.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SampleVO {

	
	private Integer mno;
	private String firstName;
	private String lastName;
	
	/*AllArgsConstructor : 기본생성자에 값을 자동으로 채워줌
	 * public SampleVO(Integer mno, String firstName, String lastName){
	 * 		this.mno = mno;
	 * 		this.firstName = fistName;
	 * 		this.lastName = lastName;
	 * }
	 * */
	
	/*NoArusContructor : 기본생성자 자동으로 만들어줌
	 * public SampleVO(){
	 * }
	 * */
	
	/*RequiredArgsConstructor : final 변수, Notnull 표시가 된 변수처럼 필수적인 정보를 세팅하는 생성자를 만들어준다.
	 * public SampleVO(Integer mno){
	 * 		this.mno = mno;
	 * }
	 * */
	
	
}
