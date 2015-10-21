# data-driven-test

Basic test building on robotframeworktutorials.com examples and applyinh to different sites, databases etc to create a 
reusable list of functions, enough for settnig up a proof of concept on a 'real' application

## Object Maps
Two methods are supported:
1. ObjectMap as a python dictionary.  Imported into tests using an argument for the page name, appropriate objects are then returned.
  + easy to use in tests
  + variables references by name directly

2. ObjectMap as a YAML file.  Imported from the base page (all objects)
 + YAML files easier to read than py file
 + All variables imported, no need to bother adding to every page pbject
 +/- Variables referenced by page_name.object_name (more code but more readable perhaps).  Possibly an issue if we have a lot of common objects
    because when writing tests, might not know where to find variable in YAML file (no lookup)
