@RestResource(urlMapping='/contact')
global class ContactHttpClass {
	
    @HttpPost
    global static String createConact(String lastName,String phoneNumber){
        Contact con = new Contact();
        con.LastName = lastName;
        con.Phone = phoneNumber;
        insert con;
        return 'Contact id: ' + con.Id;
    }
    
   @HttpGet
    global static Contact getContact() {
        RestRequest req = RestContext.request;
        String conId = req.params.get('conId');
        Contact con = [SELECT Id, LastName, Phone FROM Contact WHERE Id = :conId];
        return con;
    }
    
    @HttpDelete
    global static String deleteContact(){
        RestRequest req = RestContext.request;
        String conId = req.params.get('conId');
        Contact con = [SELECT Id FROM Contact WHERE Id = :conId];
        delete con;
        return 'Contact deleted successfully';
    } 
    
    @HttpPut
    global static ID upsertCase(String id, String lastName) {
        Contact thisCase = new Contact();
        List<Contact> conSOql = [Select Id, LastName From Contact Where Id =: id];
         
        if (!conSOql.isEmpty()) {
            thisCase = conSOql[0]; 
        } else {
            thisCase = new Contact();
        }
        
        thisCase.LastName = lastName;
        
        upsert thisCase;
        return thisCase.Id;

    }
    
    @HttpPatch
    global static ID patchCase() {
        RestRequest req = RestContext.request;
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(req.requestbody.tostring());
		
        Id conId = (Id) params.get('Id');
    	Contact conSoql = [SELECT Id, LastName FROM Contact WHERE Id = :conId];
		
   		conSoql.LastName = (String) params.get('LastName');        
        
        update conSOql;
        return conSOql.Id;

    }
}