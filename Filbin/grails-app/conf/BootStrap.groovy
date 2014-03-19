import com.filbin.Client
import com.filbin.ClientType

class BootStrap {

    def init = { servletContext ->
		
		 ClientType res = new ClientType(type: "Residential");
		 res.save();
		 ClientType comm = new ClientType(type: "Commercial");
		 comm.save();
		 
		 Client client1 = new Client(address: "1117 kenneth drive",emailAddress: "joekolba09@gmail.com",name: "Joe Kolba", notes: "Test notes....", phoneNumber: "6077600054", test: "test",  type: res);
		 client1.save();
		 
		 Client client2 = new Client(address: "240 front street",emailAddress: "kolbas00@gmail.com",name: "Ernest Kolba", notes: "Test notes....", phoneNumber: "6077857320", test: "test",  type: res);
		 client2.save();
		 
		 Client client3 = new Client(address: "240 front street",emailAddress: "kolbas00@gmail.com",name: "Patti Kolba", notes: "Test notes....", phoneNumber: "6077857320", test: "test",  type: res);
		 client3.save();
		 
		 Client client4 = new Client(address: "240 front street",emailAddress: "kolbas00@gmail.com",name: "Kaylene Kolba", notes: "Test notes....", phoneNumber: "6077857320", test: "test",  type: res);
		 client4.save();
		 
		 Client client5 = new Client(address: "240 front street",emailAddress: "kolbas00@gmail.com",name: "E&P Construction", notes: "Test notes....", phoneNumber: "6077857320", test: "test",  type: comm);
		 client5.save();
		 
		 Client client6 = new Client(address: "1117 kenneth drive",emailAddress: "kjpot13@gmail.com",name: "Kathryn Pot", notes: "Test notes....", phoneNumber: "6072422503", test: "test",  type: res);
		 client6.save();
		 
		 Client client7 = new Client(address: "1117 kenneth drive",emailAddress: "tpo1522@gmail.com",name: "Taytum Pot", notes: "Test notes....", phoneNumber: "6072422503", test: "test",  type: res);
		 client7.save();
    }
    def destroy = {
    }
}
