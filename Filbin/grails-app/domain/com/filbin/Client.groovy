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
	static hasMany = [clientFiles:Document]
	
	
	static	constraints = {
		name(nullable:false)
		emailAddress(email: true, nullable:true)
		notes(maxSize: 2000, nullable:true)
		address(nullable:true)
		phoneNumber(nullable:true)
		clientFiles(blank:true)
    }
	
	public void addToClientFiles(Document doc){
		this.clientFiles.add(doc);
	}
	
	
	String toString(){
		return name;
	}
	

}
