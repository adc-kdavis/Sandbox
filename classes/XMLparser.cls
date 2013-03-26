public with sharing class XMLparser {

		public class News {
		String url;
		String type;
		String title;
		Date eventDate;

	}

	public News parseResponseDom(String url){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        // url that returns the XML in the response body
        req.setEndpoint(url);
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        Dom.Document doc = res.getBodyDocument();
        
        //Retrieve the root element for this document.
        Dom.XMLNode address = doc.getRootElement();
        
        
        // Alternatively, loop through the child elements.
        // This prints out all the elements of the address
        for(Dom.XMLNode child : address.getChildElements()) {
           System.debug(child.getText());
        }

        News news = new News ();
        return news;
    }

 static testMethod void testFeedParser() {

 	XMLparser xmlp = new XMLparser ();
 	xmlp.parseResponseDom('www.riministreet.com/client-success-stories/?tfrm=4');

}



}
/*
/* Fields needed are...

Type - This will be Press Release, Analyst Report, Webinar or Client Success Story. - You can find the type on the first tag.

Event URL - Every page tag has a URL attribute which contains the URL link for the item.
          Short of parsing the entire document, the best approach I can see is to search for page tags where Page Locale is "en-us" and the Schema is: 
                  Press Releases:          PressReleaseDetail 
                  Analyst Reports:         ResourceComponent 
                  Webinars:                 ResourceComponent 
                  Client Success Stories:        ResourceComponent 

 Title - Every page tag has a Title attribute which contains the Title for the item.

   Event Date - This will be: 
                    Press Releases:          The Name on the page tag. 
                    Analyst Reports:         Default to current date. 
                    Webinars:                 Default to current date. 
                  Client Success Stories:        Default to current date. 
                  
  Active - checked on if event is still in XML file.  Turned off if no longer in the file. 
  
  Featured - checked on.
*/
/*
	public class News {

		String type;
		String eventURL;
		String title;
		String eventDate;
		Boolean active;
		//Boolean featured;

	}


   Feed[] parseFeeds(XmlStreamReader reader) {
     Feed[] feeds = new Feed[0];
     while(reader.hasNext()) {

         if (reader.getEventType() == XmlTag.START_ELEMENT) {
            if ('PressReleasesIndex' == reader.getLocalName()) {
            	String type = read.getAttributeValue(null, 'Name');
            	//reader.next()
				 
                Feed[] feeds = parseFeed(reader, type);
                
            }
         }
        reader.next();
     }
    return books;
   }

   // Parse through the XML, determine the author and the characters
   Feed[] parsefeed(XmlStreamReader reader, String type) {
     
     book.author = reader.getAttributeValue(null, 'author');
     while(reader.hasNext()) {
        if (reader.getEventType() == XmlTag.END_ELEMENT) {
           break;
        } else if (reader.getEventType() == XmlTag.CHARACTERS) {
           book.name = reader.getText();
        }
        reader.next();
     }
     return book;
   }

   // Test that the XML string contains specific values
   static testMethod void testBookParser() {

     XmlStreamReaderDemo demo = new XmlStreamReaderDemo();

     String str = '<PressReleasesIndex Name="Press Releases"><Page URL="MyURL" Title="The Title" eventDate="2013"></Page></PressReleasesIndex>';

     XmlStreamReader reader = new XmlStreamReader(str);
     Book[] books = demo.parseBooks(reader);

     System.debug(books.size());

     for (Book book : books) {
       System.debug(book);
     }
   }
}






















/*
	Feed[] parseFeeds (XmlStreamreader read) {
		Feed[] feeds = new Feed[0];
		system.debug(read);
		while(read.hasNext()){

			if (read.getEventType() == XmlTag.START_ELEMENT){

				if('PressReleasesIndex' == read.getLocalName()){

					String type = read.getAttributeValue(null, 'Name');
					feeds = pressReleaseFeed(read, type);
				}

				//else if()
			}
			read.next();
		}
		return feeds;
	}

	Feed[] pressReleaseFeed(XmlStreamreader read, String type){

		List<Feed> feeds = new List<Feed> ();
		
		while(read.hasNext()){
				if(read.getEventType() == xmlTag.END_ELEMENT){
					if(read.getEventType() == xmlTag.START_ELEMENT){
						if(read.getLocalName() == 'Page'){
							Feed feed = new feed ();

							feed.type = type;
							feed.eventURL = read.getAttributeValue(null, 'URL');
							feed.title = read.getAttributeValue(null, 'Title');
							feed.eventDate = read.getAttributeValue(null, 'eventDate');
							feed.active = True;
							
							feeds.add(feed);
						}
					
				}
			read.next();
		}

		return feeds;		
	}
	

   // Test that the XML string contains specific values
   static testMethod void testFeedParser() {

     XMLparser demo = new XMLparser();

     String str = 
 	'<PressReleasesIndex Name="Press Releases"><Page URL="MyURL" Title="The Title" eventDate="2013"></Page></PressReleasesIndex>';

     XmlStreamreader read = new XmlStreamreader(str);

     Feed[] feeds = demo.parseFeeds(read);

     System.debug(feeds.size());

     for (Feed feed : feeds) {
       System.debug(feed);
     }

   }
  
}
*/