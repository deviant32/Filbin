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
		name(blank:false)
		emailAddress(email: true, blank:true)
		notes(maxSize: 2000, blank:true)
		address(blank:true)
		phoneNumber(blank:true)
    }
	
	
	String toString(){
		return name;
	}
	

}
