# Sport-Competition-Database
University project for the Databases course. Implementing a logical model as a relational database and querying a database with SQL language.
## Topic: Organization of track and field competition
**Project .sql files include:** 
- creation of the database
- filling it with exemplary data 
- dropping the created database objects
- showing cascade update/delete

**Purpose/Goal of database:** Help in organizing, managing and storing huge amounts of data about events, participants and their results. Providing an easy way of accessing any kind of information related to competition. 

**Scenarios of use:**

- Accessing the scale of an event 
- Announcement of the winners 
- Controlling registration process 
- Organizer checking athlete’s licenses 
- Participants register into competition 
- Assigning participants to groups, events
- Accessing people information (telephone number to trainer) e.g. to inform about end date of registration process, 
- Generating results form an event, and therefore scored places (summing up the points)

**Scalability:**
The database should be designed to handle a potentially large volume of data as the number of sports events, 
participants, and historical results constantly grow and almost all records are preserved in the database for a very long time. 
 
## Entity Relationship Diagram
![ERD_schema](https://github.com/MajewskaM/Sport-Competition-Database/assets/115587236/dd732aa0-d4ad-4000-ba65-6b3de51d5075)
