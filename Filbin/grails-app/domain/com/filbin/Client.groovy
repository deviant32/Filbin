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
	String test; 
	
	
	static	constraints = {
		name(blank:false)
		emailAddress(email: true)
		notes(maxSize: 2000)
    }
	
	
	String toString(){
		return name;
	}
	

}
