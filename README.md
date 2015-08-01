#The Challenge

When you move into a new property you are required to notify all the suppliers that you have moved in. If you don't notify them, you might be in risk of paying bills left over by the previous tenants. You have to find your water, gas & electricity suppliers, local council and tell them you moved in. Since its a new property, it can be difficult to find who the suppliers are. Customers can use Homeshift to notify all the suppliers automatically without having to do any work. We find who supplies the property and we notify them on your behalf.

Your challenge, if you choose to accept is to build a rails application which when given a UK postcode (eg: EC2A 4BX), will return the current water supplier of the property.

To make this challenge easier, we just need you to be able to work with just two water suppliers:

* Thames water: https://www.thameswater.co.uk/your-account/605.htm
* Affinity water: https://www.affinitywater.co.uk/our-supply-area-moving-home.aspx (postcode search box on the left bar)

You can manually type in postcode on both of those pages to see if either of them supply your property.

Your rails application needs to be able to check both websites automatically on behalf of the user and return whichever one is the supplier of the property.

You'll have to use screen scraping, as the websites do not have API's. Deploy the application on Heroku and send URL to the Github repository.

