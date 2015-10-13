FORMAT: 1A
HOST: http://polls.apiblueprint.org/

# Polls
Polls is a simple API allowing consumers to view polls and vote in them.

## Group Question
Resources related to questions in the API.

## Question [/questions/{id}]
+ Parameters
    + id: 1 (number) - ID of the Question in form of an integer

+ Attributes
    + question: `Favourite programming language?` (string, required)
    + url: /questions/1 (string)

### View a Questions Detail [GET]
+ Response 200 (application/json)
    + Attributes (Question)

### Delete a Question [DELETE]
+ Relation: delete
+ Response 204

