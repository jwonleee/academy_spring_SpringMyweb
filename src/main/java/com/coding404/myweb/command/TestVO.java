package com.coding404.myweb.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//@Setter
//@Getter
//@ToString

@Data //getter, setter, toString
@NoArgsConstructor //기본 생성자
@AllArgsConstructor //모든 멤버변수 생성자
public class TestVO {

	private String name;
	private int age;
	private String address;
	
}
