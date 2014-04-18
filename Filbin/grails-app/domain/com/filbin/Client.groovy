package com.filbin


class Client {

	List types;
	
	String name;
	String phoneNumber;
	String address;
	String emailAddress;
	String notes;
	Date dateCreated;
	ClientType type;
	
	
	static	constraints = {
		name(nullable:false)
		emailAddress(email: true, nullable:true)
		notes(maxSize: 2000, nullable:true)
		address(nullable:true)
		phoneNumber(nullable:true)
    }
	
	
	String toString(){
		return name;
	}
	

}
