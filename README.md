#The Challenge

When you move into a new property you are required to notify all the suppliers that you have moved in. If you don't notify them, you might be in risk of paying bills left over by the previous tenants. You have to find your water, gas & electricity suppliers, local council and tell them you moved in. Since its a new property, it can be difficult to find who the suppliers are. Customers can use Homeshift to notify all the suppliers automatically without having to do any work. We find who supplies the property and we notify them on your behalf.

Your challenge, if you choose to accept is to build a rails application which when given a UK postcode (eg: EC2A 4BX), will return the current water supplier of the property.

To make this challenge easier, we just need you to be able to work with just two water suppliers:

* Thames water: https://www.thameswater.co.uk/your-account/605.htm (EC2A 4BX)
* Affinity water: https://www.affinitywater.co.uk/our-supply-area-moving-home.aspx (postcode search box on the left bar) (AL10 9EZ)

You can manually type in postcode on both of those pages to see if either of them supply your property.

Your rails application needs to be able to check both websites automatically on behalf of the user and return whichever one is the supplier of the property.

You'll have to use screen scraping, as the websites do not have API's. Deploy the application on Heroku and send URL to the Github repository.

##Business Logic

I'm not familiar with the scope of the project, so I had to make some assumptions

* There's an object called Person, with only name and nin (National Insurance Number)
* There's an object called House, with title, description, address, postcode and tenant (relationship with Person)

To check wheather the house is supplied by one of those companies, I added a **before_save** callback that goes through either one and stores the company on the database. To notify the company about the new tenant that is moving in, I've added a **after_save** callback that only outputs a message that the company was notified.

## The Scrapers

I added the Scrapers as a lib under **lib/scrapers**. I've created a generic one (**Scraper**) that has the default basic funcionality. Since we cannot have a generic scraper, I don't allow this class to be initialized.

Then, we have the two specific scrapers:

* AffinityWater
* ThamesWater

Those scrapers implements the funcionality and responds to **is_supplier?** method.

On the AffinityWater Scraper, I've used the **Mechanize** gem, that allowed me to navigate on their website like a regular browser. The reason for this is that they use an ASP.NET template page, that has a single form across all pages to manage any post request. On the response page, I check for their html and find out if they supply or not based on a response string.

On the ThamesWater Scraper, I've used a regular post request to their service, on the same way the site does. I figured out that the response is always a redirect to 2 pages, 1 is a failure and the other one is a success page. What I had to do is check where the response was redirecting to to return if it was the supplier or not.

## Tests

This app was build using RSpec for tests. I tried to cover as much as possible on the code. The tests are running a bit slower, but this is intentional. I could mock all requests on scrapers, but I decided not to. In a real world case, I wouldn't event think about not mocking it.
