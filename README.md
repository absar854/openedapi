OpenEd API
==========

OpenEd is the world's largest educational resource catalog, currently with over 250,000 videos, games and other resources.  It is the only site completely focused on aligning educational resources to standards.   

The OpenEd API lets you use the capabilities of the OpenEd engine for finding resources and providing information about educational standards (Common Core and otherwise) inside your own apps and websites.

All API access is over HTTPS, and accessed from the api.opened.io domain. All data is sent and received as JSON.  API calls which make changes require OAuth 2 authentication.

RESOURCES
=========

Find Resources
--------------
Search for resources based on:
* descriptive - searches title and description fields with fuzzy match, need to URL-encode strings with spaces and special characters
* grade - restricts to specified grades (expressed as K,1, ..12)
* standard - looks for resources aligned with specified standard identifier (can be combined)
* user - unique ID of user, for logging purposes
* limit - number of resources to return, defaults to 20
* ids - comma separated list of resource IDs

For example:

` https://api.opened.io/resources.json?descriptive=Quadratic%20Equations&number=3 `

will return a JSON object like the following

```json

```

As another example you can search for resources matching a specific standard or standards with the following:

` https://api.opened.io/resources.json?standard=K.CC.1 `

will return

```json
https://api.opened.io/resources.json?descriptive=Quadratic%20Equations&limit=2
```

Show Resource 
-------------
Display the attributes for a specific resource, based on the OpenEd resource ID (a unique integer)

For example:

` https://api.opened.io/resources/183426.json `

will return

```json
{"area_id":1,"description":null,"embeddable":false,"id":183426,"imported_area_id":null,"imported_subject_id":null,"is_patched":null,"thumb":"https://opened.s3.amazonaws.com/pictures/183426/thumb/KhanAcademy.jpeg?1362719117","thumb_status":null,"title":"Systems of equations","youtube_id":null,"safe_url":"http://www.khanacademy.org/exercise/systems_of_equations","contribution_name":"KhanAcademyCommonCore","grade_idents":["8","9","10","11","12"],"standard_idents":["8.EE.8","8.EE.8.a","8.EE.8.b","8.EE.8.c","A.CED.3","A.REI.6"],"grades_range":"8-12","resource_type_title":"Exercise","area_title":"Mathematics","subject_titles":["Algebra"],"grades":[{"grade":"8"},{"grade":"9"},{"grade":"10"},{"grade":"11"},{"grade":"12"}],"standards":[{"identifier":"8.EE.8"},{"identifier":"8.EE.8.a"},{"identifier":"8.EE.8.b"},{"identifier":"8.EE.8.c"},{"identifier":"A.CED.3"},{"identifier":"A.REI.5"},{"identifier":"A.REI.6"}]}
```

STANDARDS
=========

OpenEd also allows you to search for information on standards themselves (in addition to finding resources for standards).  Standards are organized into "standard groups" such as "Common Core Math" and "Common Core Language Arts".  Within a standard group there are "grade groups" such as "Elementary" and "Middle School".  Each grade group has a set of "categories" (sometimes known as "strands"), such as "Geometry". Within categories there are individual standards. This method of organizing standards was created by the Common Core State Standards, but we use it to structure all standard groups.  

Standard Groups
---------------
List all standard groups.

For example:
` http://api.opened.io/standard_groups.json `

will return:

```json
{"standard_groups":[{"id":2,"name":"Common Core Language Arts","title":"Common Core Language Arts","count":3844},{"id":7,"name":"Common Core Literacy:History/Social Studies, Science, and Technical Subjects","title":"Common Core Literacy:History/Social Studies, Science, and Technical Subjects","count":206},{"id":4,"name":"Common Core Math","title":"Common Core Math","count":9072},{"id":9,"name":"National Geography Standards","title":"National Geography Standards","count":78},{"id":5,"name":"New York Common Core Social Studies","title":"New York Common Core Social Studies","count":880},{"id":6,"name":"Next Generation Science Standards","title":"Next Generation Science Standards","count":603},{"id":1,"name":"Social Studies (California History Standards)","title":"Social Studies (California History Standards)","count":984}]}
```

Grade Groups
------------
You can also list the grade groups that are available in a given standard group. For example:

` http://api.opened.io/grade_groups.json?standard_group=Common%20Core%20Math `

will return:

```json
{"grade_groups":[{"grade_groups":{"created_at":"2012-10-02T11:41:05Z","display":"Elementary","gg_sort_key":1,"id":46,"ident":"K,1,2,3,4,5,6","name":"Elementary","standard_group_id":null,"updated_at":"2013-10-11T17:57:04Z"}},{"grade_groups":{"created_at":"2012-10-02T11:41:06Z","display":"Middle School","gg_sort_key":2,"id":47,"ident":"6,7,8,6-8","name":"Middle School","standard_group_id":null,"updated_at":"2013-10-11T17:57:04Z"}},{"grade_groups":{"created_at":"2012-10-02T11:41:22Z","display":"High School: Algebra","gg_sort_key":null,"id":49,"ident":"A","name":"High School: Algebra","standard_group_id":null,"updated_at":"2012-12-09T17:15:29Z"}},{"grade_groups":{"created_at":"2012-10-02T11:41:22Z","display":"High School: Functions","gg_sort_key":null,"id":50,"ident":"F","name":"High School: Functions","standard_group_id":null,"updated_at":"2012-12-09T17:16:22Z"}},{"grade_groups":{"created_at":"2012-10-02T11:41:22Z","display":"High School: Geometry","gg_sort_key":null,"id":51,"ident":"G","name":"High School: Geometry","standard_group_id":null,"updated_at":"2012-12-09T17:16:12Z"}},{"grade_groups":{"created_at":"2012-10-02T11:41:23Z","display":"High School: Number and Quantity","gg_sort_key":null,"id":52,"ident":"NQ","name":"High School: Number and Quantity","standard_group_id":null,"updated_at":"2013-02-13T15:57:48Z"}},{"grade_groups":{"created_at":"2012-10-02T11:41:23Z","display":"High School: Statistics & Probability ","gg_sort_key":null,"id":53,"ident":"SP","name":"High School: Statistics & Probability ","standard_group_id":null,"updated_at":"2013-02-13T15:53:28Z"}}]}
```

Categories
----------
You can list the categories (also known as "strands") based on several criteria:
* standard_group - shows all categories within a standard group
* grade_group - shows all categories within a grade group (typically combined with a standard group)

For example:

` http://api.opened.io/categories.json?standard_group=Common%20Core%20Math `

will return a long list of categories (not shown here)

Standards
---------
Search for standards based on identifier (e.g. "K.CC.1") or keyword. 

For example:
` http://api.opened.io/standards/search.json?identifier=K.CC.1 `

will return:
```json
{"id":21461,"fullname":null,"identifier":"K.CC.1","title":"Count to 100 by ones and by tens.","description":"Count to 100 by ones and by tens.","more_information":"","category":"Counting and Cardinality","grade_group":"Elementary","standard_group":"Common Core Math"}
```

Or
` https://api.opened.io/standards/search.json?keyword=polygon `
will return:
```json
{"standards":[{"id":9364,"identifier":"G.CO.3","fullname":"CC.9-12.G.CO.3","title":"Given a rectangle, parallelogram, trapezoid, or regular polygon, describe the rotations and reflections that carry it onto itself.","category_id":135,"key_words":"rectangle rotations, rectangle reflections, parallelogram rotations, parallelogram reflections, symmetry, symmetric, rotational symmetry, reflective symmetry","more_information":""},{"id":9399,"identifier":"G.GPE.7","fullname":"CC.9-12.G.GPE.7","title":"Use coordinates to compute perimeters of polygons and areas of triangles and rectangles, e.g., using the distance formula.","category_id":278,"key_words":"perimeters of polygons, areas of triangles, areas of rectangles, areas of polygons, perimeters of triangles, perimeters of rectangles, distance formula, G.GPE.7","more_information":""},{"id":21182,"identifier":"7.G.6","fullname":"CC.7.G.6","title":"Solve real-world and mathematical problems involving area, volume and surface area of two- and three-dimensional objects composed of triangles, quadrilaterals, polygons, cubes, and right prisms.","category_id":322,"key_words":null,"more_information":null},{"id":21140,"identifier":"6.G.1","fullname":"CC.6.G.1","title":"Find the area of right triangles, other triangles, special quadrilaterals, and polygons by composing into rectangles or decomposing into triangles and other shapes; apply these techniques in the context of solving real-world and mathematical problems.","category_id":322,"key_words":"area of a triangle, triangle, area of a rectangle, rectangle, area, find the area, decompose a shape, 6.g.1 ","more_information":"Students should know how to find the area of rectangles and right triangles. Using that knowledge students can find the areas of other shapes composed of rectangles and right triangles."},{"id":21026,"identifier":"3.MD.8","fullname":"CC.3.MD.8","title":"Solve real world and mathematical problems involving perimeters of polygons.","category_id":263,"key_words":"real world problem, mathematical problem, perimeters of polygons, perimeter, area, rectangles, 3.MD.8","more_information":""},{"id":21142,"identifier":"6.G.3","fullname":"CC.6.G.3","title":"Draw polygons in the coordinate plane given coordinates for the vertices; use coordinates to find the length of a side joining points with the same first coordinate or the same second coordinate.","category_id":322,"key_words":"draw polygons, coordinate plane, vertices, find the length, 6.g.3, find perimeter","more_information":""}]}
```

