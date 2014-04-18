package com.filbin

/**
 * ClientType
 * A domain class describes the data object and it's mapping to the database
 */
class ClientType {

	String type;
    
	static	constraints = {
    }
	
	String toString(){
		return this.type;
	}
	

}
