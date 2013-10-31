OpenEd API
==========

OpenEd is the world's largest educational resource catalog, currently with over 250,000 videos, games and other resources.  It is the only site completely focused on aligning educational resources to standards.   

The OpenEd API lets you use the capabilities of the OpenEd engine for finding resources and providing information about educational standards (Common Core and otherwise) inside your own apps and websites.

All API access is over HTTPS, and accessed from the api.opened.io domain. All data is sent and received as JSON.  API calls which make changes require OAuth 2 authentication.

MANAGING RESOURCES
==================

OpenEd allows videos to be searchable with the following REST API, from any app, web or otherwise.


Resource Search
---------------

Find resources based on:

* descriptive - searches title, description, area_title and subject_title with Solr fulltext search
* standard_group_id - looks for resources aligned with specified standards are in the standard_group by standard_group.id
* category - looks for resources aligned with specified standards are in the category by category.id or category.title
* standard - looks for resources aligned with specified standard by standard.id (the internal object ID) or standard.identifier (the Common Core ID)
* area - looks for resources assigned with specified area (and/or with specified subjects of area) by area.id or area.title
* subject - looks for resources assigned with specified subject by subject.id or subject.title
* grade - restricts to specified grades (expressed as K,1, .. 12)
* ids - comma separated list of resource IDs (will skip all given filters)
* limit - resources to return, default to 50

For example:

` https://api.opened.io/resources.json?descriptive=Fibonacci%20sequence&limit=3 `

will return a JSON object like the following

```json
{
  "resources": [
    {
      "standard_idents": [
        "F.IF.3"
      ],
      "grade_idents": [
        "6",
        "7",
        "8",
        "9",
        "10",
        "11",
        "12"
      ],
      "grades_range": "6-12",
      "contribution_name": "PBS",
      "description": "Apply the Fibonacci Sequence and find its relationship to a piano keyboard. Explore various relationships between music and the Fibonacci Sequence.",
      "embeddable": false,
      "resource_type": "other",
      "id": 101504,
      "thumb": "https://opened.s3.amazonaws.com/pictures/101504/thumb/pbs-logo.png?1358125703",
      "title": "The Fibonacci Keyboard",
      "share_url": "http://www.opened.io/#/share/101504",
      "rating": 3,
      "my_rating": null,
      "safe_url": "http://www.pbs.org/jazz/classroom/fibonacci.htm"
    },
    {
      "standard_idents": [
      ],
      "grade_idents": [
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
        "11",
        "12"
      ],
      "grades_range": "5-12",
      "contribution_name": "Learnist",
      "description": "Hank introduces us to the most beautiful numbers in nature - the Fibonacci sequence.",
      "embeddable": true,
      "resource_type": "video",
      "id": 110037,
      "thumb": "https://opened.s3.amazonaws.com/pictures/110037/thumb/wTlw7fNcO-0.?1359197625",
      "title": "The Fibonacci Sequence: Nature's Code",
      "share_url": "http://www.opened.io/#/share/110037",
      "rating": 3,
      "my_rating": null,
      "safe_url": "https://www.youtube.com/watch?v=wTlw7fNcO-0"
    },
    {
      "standard_idents": [
      ],
      "grade_idents": [
      ],
      "grades_range": "",
      "contribution_name": "KhanAcademy",
      "description": "Introduction to the Fibonacci Sequence and a programming challenge",
      "embeddable": true,
      "resource_type": "video",
      "id": 368646,
      "thumb": "https://opened.s3.amazonaws.com/pictures/368646/thumb/Bdbc1ZC-vhw.?1374716351",
      "title": "Exercise - Write a Fibonacci Function",
      "share_url": "http://www.opened.io/#/share/368646",
      "rating": 3,
      "my_rating": null,
      "safe_url": "https://www.youtube.com/watch?v=Bdbc1ZC-vhw&feature=youtube_gdata_player"
    }
  ]
}
```

As another example you can search for resources matching a specific standard or standards with the following:

` https://api.opened.io/resources.json?standard=A.APR.4&limit=3 `

will return

```json
{
  "resources": [
    {
      "standard_idents": [
        "A.APR.4"
      ],
      "grade_idents": [
        "9",
        "10",
        "11",
        "12"
      ],
      "grades_range": "9-12",
      "contribution_name": "OpenEd",
      "description": "Proving polynomial identities",
      "embeddable": true,
      "resource_type": "video",
      "id": 350261,
      "thumb": "https://opened.s3.amazonaws.com/pictures/350261/thumb/open-uri20130814-2-1rqhb8a..?1376516273",
      "title": "1. Polynomials - Introduction of Identities - YouTube",
      "share_url": "http://www.opened.io/#/share/350261",
      "rating": 3,
      "my_rating": null,
      "safe_url": "http://m.youtube.com/watch?v=RrMlR3KJFtA"
    },
    {
      "standard_idents": [
        "A.APR.4"
      ],
      "grade_idents": [
        "9",
        "10",
        "11",
        "12"
      ],
      "grades_range": "9-12",
      "contribution_name": "OpenEd",
      "description": "Description of the standard and a worksheet to give students with the answers provided. ",
      "embeddable": false,
      "resource_type": "other",
      "id": 350260,
      "thumb": "https://opened.s3.amazonaws.com/pictures/350260/thumb/Black_Eye.png?1376518509",
      "title": "Common Core Standards : A-APR.4",
      "share_url": "http://www.opened.io/#/share/350260",
      "rating": 3,
      "my_rating": null,
      "safe_url": "http://www.shmoop.com/common-core-standards/ccss-hs-a-apr-4.html"
    },
    {
      "standard_idents": [
        "A.APR.4"
      ],
      "grade_idents": [
        "9",
        "10",
        "11",
        "12"
      ],
      "grades_range": "9-12",
      "contribution_name": "ShmoopCommonCore",
      "description": "4. Prove polynomial identities and use them to describe numerical relationships. For example, the polynomial identity (x2 + y2)2 = (x2 \u00e2\u0080\u0093 y2)2 + (2xy)2 can be used to generate Pythagorean triples.",
      "embeddable": false,
      "resource_type": "other",
      "id": 398923,
      "thumb": "https://opened.s3.amazonaws.com/pictures/398923/thumb/open-uri20130814-2-1lzbljc..?1376516091",
      "title": "Common Core Standards : A-APR.4: Links",
      "share_url": "http://www.opened.io/#/share/398923",
      "rating": 3,
      "my_rating": null,
      "safe_url": "http://www.shmoop.com/common-core-standards/ccss-hs-a-apr-4.html#links"
    }
  ]
}
```

You should use the share_url attribute as the URL to display to your users.   The underlying resource is safe_url, but it is (ironically) "unsafe" (the underlying resources can move).  If you use share_url OpenEd manages underlying URLs movements.

Add Resources to OpenEd
-----------------------
[This call requires OAuth2 authentication]

You can also add resources to the OpenEd catalog in bulk. This requires a list of URLs of existing resources, hosted somewhere.  

The add method takes a hash with a "resources" array similar to what you see above on search. It will be invoked as follows:

` https://api.opened.io/resources/add.json `

In the body of the post method the resources hash is provided in JSON form. Each resource in the hash can have the following attributes:
* url - where is the resource hosted - REQUIRED
* title - what do you want to call the resource. It doesn't have to match what you have on your site - REQUIRED
* description - more information about the resource.  You are strongly urged to supply a description as it helps the OpenEd recommendation engine highlight your resirces
* standard_idents - the list of standards aligned to the resource.  You do not have to supply this. OpenEd will attempt to determine alignments once your resource is contributed
* grades_range - in the form "lowgrade-highgrade", e.g. "K-4"
* contribution_name - your site as the contributor so we can give you credit
* resource_type - Either "video", "game", "assessment", or "other"
* rating - The rating of the resource on a scale of "1" to "5" if you have one on your site 

 For example:

```json
{
  "resources": [
    {
      "url": "http://yoursite.com/yourawesomevideo.mp4",
      "title": "My Awesome Counting Video",
      "description": "Vun octopus arm, two octopus arms..three vunderful octopus arms",
      "standard_idents": [
        "K.CC.1",
        "K.CC.4"
      ],
      "grades_range": "K-1",
      "contribution_name": "YourSite",
      "description",
      "resource_type": "video",
      "rating": "5"
    }
  ]
}```

[Not Implemented Yet]

Upload Resource to OpenEd
-------------------------
[This call requires OAuth2 authentication]

This uploads the actual resource binary itself to OpenEd.  We use YouTube to host videos.  We have our own server space for other resources.

[Not Implemented Yet]

MANAGING STANDARDS
==================

OpenEd also allows you to search for information on standards themselves (in addition to finding resources for standards).  Standards are organized into "standard groups" such as "Common Core Math" and "Common Core Language Arts".  Within a standard group there are "grade groups" such as "Elementary" and "Middle School".  Each grade group has a set of "categories" (sometimes known as "strands"), such as "Geometry". Within categories there are individual standards. This method of organizing standards was created by the Common Core State Standards, but we use it to structure all standard groups.  



Standard Groups
---------------
List all standard groups along with resource counts.  

For example:
` http://api.opened.io/standard_groups.json `

will return the full list below:

```json
{
  "standard_groups": [
    {
      "id": 2,
      "name": "Common Core Language Arts",
      "title": "Common Core Language Arts",
      "count": 3844
    },
    {
      "id": 7,
      "name": "Common Core Literacy:History/Social Studies, Science, and Technical Subjects",
      "title": "Common Core Literacy:History/Social Studies, Science, and Technical Subjects",
      "count": 206
    },
    {
      "id": 4,
      "name": "Common Core Math",
      "title": "Common Core Math",
      "count": 9072
    },
    {
      "id": 9,
      "name": "National Geography Standards",
      "title": "National Geography Standards",
      "count": 78
    },
    {
      "id": 5,
      "name": "New York Common Core Social Studies",
      "title": "New York Common Core Social Studies",
      "count": 880
    },
    {
      "id": 6,
      "name": "Next Generation Science Standards",
      "title": "Next Generation Science Standards",
      "count": 603
    },
    {
      "id": 1,
      "name": "Social Studies (California History Standards)",
      "title": "Social Studies (California History Standards)",
      "count": 984
    }
  ]
}
```

Grade Groups
------------
You can also list the grade groups that are available in a given standard group. It will the grade group along with the grades corresponding to that group.  

For example:

` http://api.opened.io/grade_groups.json?standard_group=Common%20Core%20Math `

will return the full list below:

```json
{
  "grade_groups": [
    {
      "grade_groups": {
        "created_at": "2012-10-02T11:41:05Z",
        "display": "Elementary",
        "gg_sort_key": 1,
        "id": 46,
        "ident": "K,1,2,3,4,5,6",
        "name": "Elementary",
        "standard_group_id": null,
        "updated_at": "2013-10-11T17:57:04Z"
      }
    },
    {
      "grade_groups": {
        "created_at": "2012-10-02T11:41:06Z",
        "display": "Middle School",
        "gg_sort_key": 2,
        "id": 47,
        "ident": "6,7,8,6-8",
        "name": "Middle School",
        "standard_group_id": null,
        "updated_at": "2013-10-11T17:57:04Z"
      }
    },
    {
      "grade_groups": {
        "created_at": "2012-10-02T11:41:22Z",
        "display": "High School: Algebra",
        "gg_sort_key": null,
        "id": 49,
        "ident": "A",
        "name": "High School: Algebra",
        "standard_group_id": null,
        "updated_at": "2012-12-09T17:15:29Z"
      }
    },
    {
      "grade_groups": {
        "created_at": "2012-10-02T11:41:22Z",
        "display": "High School: Functions",
        "gg_sort_key": null,
        "id": 50,
        "ident": "F",
        "name": "High School: Functions",
        "standard_group_id": null,
        "updated_at": "2012-12-09T17:16:22Z"
      }
    },
    {
      "grade_groups": {
        "created_at": "2012-10-02T11:41:22Z",
        "display": "High School: Geometry",
        "gg_sort_key": null,
        "id": 51,
        "ident": "G",
        "name": "High School: Geometry",
        "standard_group_id": null,
        "updated_at": "2012-12-09T17:16:12Z"
      }
    },
    {
      "grade_groups": {
        "created_at": "2012-10-02T11:41:23Z",
        "display": "High School: Number and Quantity",
        "gg_sort_key": null,
        "id": 52,
        "ident": "NQ",
        "name": "High School: Number and Quantity",
        "standard_group_id": null,
        "updated_at": "2013-02-13T15:57:48Z"
      }
    },
    {
      "grade_groups": {
        "created_at": "2012-10-02T11:41:23Z",
        "display": "High School: Statistics & Probability ",
        "gg_sort_key": null,
        "id": 53,
        "ident": "SP",
        "name": "High School: Statistics & Probability ",
        "standard_group_id": null,
        "updated_at": "2013-02-13T15:53:28Z"
      }
    }
  ]
}
```

Categories
----------
You can list the categories (also known as "strands") based on several criteria. It will also return a count of resources.  
* standard_group - shows all categories within a standard group
* grade_group - restricts the categories to those associated with a specific grade group, such as Elementary (coming soon)
* grade - restricts the categories to those associated with specific grade groups that have that grade (coming soon)

For example:

` http://api.opened.io/categories.json?standard_group=Common%20Core%20Math `

will return these categories (artificially limited to first six):

```json
{
  "categories": [
    {
      "id": 424,
      "title": "A Child\u2019s Place in Time and Space",
      "grade_group": "Elementary",
      "count": 46
    },
    {
      "id": 489,
      "title": "Biological Evolution: Unity and Diversity (K-5)",
      "grade_group": "Elementary",
      "count": 37
    },
    {
      "id": 427,
      "title": "California: A Changing State",
      "grade_group": "Elementary",
      "count": 54
    },
    {
      "id": 470,
      "title": "Civic Ideals and Practices",
      "grade_group": "Elementary",
      "count": 72
    },
    {
      "id": 426,
      "title": "Continuity and Change - Cultural Landscape of California, American Indians, and Impact of New Immigrants",
      "grade_group": "Elementary",
      "count": 55
    },
    {
      "id": 260,
      "title": "Counting and Cardinality",
      "grade_group": "Elementary",
      "count": 231
    }
  ]
}
```

Standards
---------

Get the list of standards with number of aligned resources based on parameters:

* category - just the standards for a given standard category
* standard_group_id - just the standards for a given standard group
* grade_group - just the standards for a given grade group (generally combined with standard group, since the category is already within a grade group)
* grade - just the standards relevant to a given grade (K-12), generally combined with standard group or category

For example: 

` https://api.opened.io/standards.json?category=260 `

returns: 

```json
{
  "standards": [
    {
      "id": 21461,
      "identifier": "K.CC.1",
      "title": "Count to 100 by ones and by tens.",
      "description": "Count to 100 by ones and by tens.",
      "key_words": "counting,numbers,digits,count by tens, count by ones, count to 100, k.cc.1\r\n",
      "more_information": "",
      "count": 128
    },
    {
      "id": 20916,
      "identifier": "K.CC.2",
      "title": "Count forward beginning from a given number within the known sequence (instead of having to begin at 1).",
      "description": "Count forward beginning from a given number within the known sequence (instead of having to begin at 1).",
      "key_words": "counting,count forward, numbers, count, k.cc.2",
      "more_information": "",
      "count": 47
    },
    {
      "id": 20917,
      "identifier": "K.CC.3",
      "title": "Write numbers from 0 to 20. Represent a number of objects with a written numeral 0-20 (with 0 representing a count of no objects).",
      "description": "Write numbers from 0 to 20. Represent a number of objects with a written numeral 0-20 (with 0 representing a count of no objects).",
      "key_words": "write numbers, make numbers, count, 0-20, count, number, k.cc.3",
      "more_information": "",
      "count": 32
    },
    {
      "id": 20918,
      "identifier": "K.CC.4",
      "title": "Understand the relationship between numbers and quantities; connect counting to cardinality.",
      "description": "Understand the relationship between numbers and quantities; connect counting to cardinality.",
      "key_words": "number, quantity, counting, cardinality, count objects, k.cc.4",
      "more_information": "",
      "count": 91
    },
    {
      "id": 21484,
      "identifier": "K.CC.4.a",
      "title": "When counting objects, say the number names in the standard order, pairing each object with one and only one number name and each number name with one and only one object.",
      "description": "When counting objects, say the number names in the standard order, pairing each object with one and only one number name and each number name with one and only one object.",
      "key_words": "count, counting, count objects, number, name numbers, match numbers, k.cc.4a, k.cc.4.a",
      "more_information": "Students implement correct counting procedures by pointing to one object at a time (one-to-one correspondence), using one counting word for every object.",
      "count": 43
    },
    {
      "id": 20920,
      "identifier": "K.CC.4.b",
      "title": "Understand that the last number name said tells the number of objects counted. The number of objects is the same regardless of their arrangement or the order in which they were counted.",
      "description": "Understand that the last number name said tells the number of objects counted. The number of objects is the same regardless of their arrangement or the order in which they were counted.",
      "key_words": "counting, count, count objects, how many are there, how many, k.cc.4.b, k.cc.4b",
      "more_information": "Students implement correct counting procedures by pointing to one object at a time (one-to-one correspondence), using one counting word for every object (synchrony/ one-to-one tagging), while keeping track of objects that have and have not been counted.",
      "count": 39
    },
    {
      "id": 20921,
      "identifier": "K.CC.4.c",
      "title": "Understand that each successive number name refers to a quantity that is one larger.",
      "description": "Understand that each successive number name refers to a quantity that is one larger.",
      "key_words": "count, counting, numbers, count objects, add 1, plus 1, 1 more, inclusion, successive number",
      "more_information": "Students should know that if they have three objects, that in order to make four, they do not need to start all over again. Students should also be able to answer \"How many would you have if we added one more?\"",
      "count": 30
    },
    {
      "id": 8941,
      "identifier": "K.CC.5",
      "title": "Count to answer \u201chow many?\u201d questions about as many as 20 things arranged in a line, a rectangular array, or a circle, or as many as 10 things in a scattered configuration; given a number from 1\u201320, count out that many objects.",
      "description": "Count to answer \u201chow many?\u201d questions about as many as 20 things arranged in a line, a rectangular array, or a circle, or as many as 10 things in a scattered configuration; given a number from 1\u201320, count out that many objects.",
      "key_words": "count objects, count, counting, count 0-20, how many, count to 20, K.CC.5",
      "more_information": "Students should be able to count objects using strategies like touching, moving or lining them up.",
      "count": 65
    },
    {
      "id": 8942,
      "identifier": "K.CC.6",
      "title": "Identify whether the number of objects in one group is greater than, less than, or equal to the number of objects in another group, e.g., by using matching and counting strategies.",
      "description": "Identify whether the number of objects in one group is greater than, less than, or equal to the number of objects in another group, e.g., by using matching and counting strategies.",
      "key_words": "comparing numbers, counting, count, compare, more or less, compare, k.cc.6",
      "more_information": "Students use their counting ability to compare sets of objects (0-10). ",
      "count": 24
    },
    {
      "id": 8943,
      "identifier": "K.CC.7",
      "title": "Compare two numbers between 1 and 10 presented as written numerals.",
      "description": "Compare two numbers between 1 and 10 presented as written numerals.",
      "key_words": "comparing numbers, compare, numbers, more or less, compare numerals, written numbers, k.cc.7",
      "more_information": "Comparing written numbers only, not objects.",
      "count": 14
    }
  ]
}
```

AREA/SUBJECT TAXONOMY
=====================
OpenEd categorizes all resources in an area/subject taxonomy.  The top level is areas such as Math and Language Arts.  The next level is subject such as Geometry or Writing.

Areas List
----------
Areas with number of assigned resources for area and/or for subjects in area. For example: 

` https://api.opened.io/areas.json `

returns the following areas:

```json
{
  "areas": [
    {
      "id": 1,
      "title": "Mathematics",
      "count": 7460
    },
    {
      "id": 2,
      "title": "Language Arts",
      "count": 3929
    },
    {
      "id": 3,
      "title": "Social Studies",
      "count": 1172
    },
    {
      "id": 4,
      "title": "Science",
      "count": 837
    },
    {
      "id": 5,
      "title": "Other",
      "count": 32
    }
  ]
}
```

Subjects List
-------------
Get the list of subjects with number of assigned resources based on parameters:
* area - just the subjects for a given area 

For example: https://openedengine-ember10-staging.herokuapp.com/subjects.json?area=1
```json
{
  "subjects": [
    {
      "id": 6,
      "title": "Measurement & Data",
      "count": 1041
    },
    {
      "id": 1,
      "title": "Geometry",
      "count": 1277
    },
    {
      "id": 4,
      "title": "Trigonometry",
      "count": 84
    },
    {
      "id": 3,
      "title": "Statistics and Probability",
      "count": 583
    },
    {
      "id": 2,
      "title": "Algebra",
      "count": 2039
    },
    {
      "id": 14,
      "title": "Number Sense and Operations",
      "count": 3013
    }
  ]
}
```
