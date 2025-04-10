public class WeatherService {
    public class WeatherRes {
        public Location location;
        public Current current;
    }
    
    public class Location {
        public String name;
        public String region;
        public String country;
    }
    
    public class Current {
        public Double temp_c;
        public Condition condition;
    }
    
    public class Condition {
        public String text;
    }

    public static void fetchWeather(String city) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:WeatherAPI/current.json?q=' + city + '&aqi=no');
        request.setMethod('GET');

        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            WeatherRes weather = (WeatherRes) JSON.deserialize(response.getBody(), WeatherRes.class);
            System.debug(weather);
            
            Account accRecord = new Account(
                Name = weather.location.name + ' ' + weather.location.region + ' ' + weather.location.country,
                NumberofLocations__c = weather.current.temp_c,
                Description = weather.current.condition.text
            );
    
            insert accRecord;
        } else {
            throw new CalloutException('Failed: ' + response.getStatus());
        }
    }
}