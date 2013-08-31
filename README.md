OpenEd API
==========

OpenEd is the world's largest educational resource catalog.  It is the only site completely focused on aligning educational resources to standards.   

The OpenEd API lets you use the capabilities of the OpenEd engine for finding resources and providing information about educational standards (Common Core and otherwise) inside your own apps and websites.

All API access is over HTTPS, and accessed from the api.opened.io domain. All data is sent and received as JSON.  API calls which make changes require OAuth 2 authentication.

Get Resources
-------------

Find resources based on:
* ids - comma separated list of resource IDs
* descriptive: (searches title and description with fuzzy match) 
* title
* description
* grade
* standard
* user - unique ID of user, for logging purposes
* number of resources to return, defaults to 20

` GET /resources.json`

For example:

` http://api.opened.io/resources.json?descriptive=Algebra `
