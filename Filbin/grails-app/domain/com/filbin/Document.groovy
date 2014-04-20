package com.filbin

class Document {
    String filename
    String fullPath
	static belongsTo    = [client:Client]
    Date uploadDate = new Date()
    static constraints = {
        filename(blank:false,nullable:false)
        fullPath(blank:false,nullable:false)
    }
}