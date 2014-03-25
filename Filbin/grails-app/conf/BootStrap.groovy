import com.filbin.Client
import com.filbin.ClientType
import com.filbin.Footer
import com.filbin.JobType
import com.filbin.LetterHead

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
		 
		 LetterHead lh = new LetterHead(title:"Painting Letter Head", contents:"<h1>Filbin Painting</h1>");
		 lh.save();
		 
		 Footer f = new Footer(title:"Standard Footer", contents:"<p>Copyright 2014</p>");
		 f.save();
		 
		 JobType painting = new JobType(name:"Interior Residential Painting", jsonFormText:'{"0":[{"value":"","label":"Number of Rooms","name":"numrooms","type":"inputbox"},{"value":"","label":"Estimated Time","name":"Estimated_Time","type":"inputbox"},{"value":"","label":"Square Footage","name":"Square_Footage","type":"inputbox"},{"label":"Sheen","name":"","fieldOptions":[{"optionValue":"Satin","optionLabel":"Satin"},{"optionValue":"Semi Gloss","optionLabel":"Semi Gloss"},{"optionValue":"Gloss","optionLabel":"Gloss"}],"type":"dropdown"}]}');
		 painting.save();
		 
		 JobType powerWashing = new JobType(name:"Residential Power Washing", jsonFormText:'{"0":[{"value":"","label":"Square Footage","name":"squarefootage","type":"inputbox"},{"value":"","label":"Estimated Time","name":"time","type":"inputbox"},{"label":"Materials","name":"","fieldOptions":[{"optionValue":"Hose Extension","optionLabel":"Hose extension"},{"optionValue":"Chemicals","optionLabel":"Chemicals"},{"optionValue":"6 Foot Ladder","optionLabel":"6 Foot Ladder"},{"optionValue":"8 Foot Ladder","optionLabel":"8 Foot Ladder"},{"optionValue":"10 Foot Ladder","optionLabel":"10 Foot Ladder"},{"optionValue":"Drop Cloth","optionLabel":"Drop Cloth"}],"type":"selectlist"},{"value":"","label":"Comments","name":"Comments","type":"textarea"}]}');
		 powerWashing.save();
		 
		 
    }
    def destroy = {
    }
}
