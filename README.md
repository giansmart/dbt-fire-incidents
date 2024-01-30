
Welcome to your my dbt project!

## Fire Incidents with DBT and Postgres using Docker

I'm using the dataset available on [DataSF site](https://data.sfgov.org/Public-Safety/Fire-Incidents/wr8u-xric/about_data).

Fire Incidents includes a summary of each (non-medical) incident to which the SF Fire Department responded. Each incident record includes the call number, incident number, address, number and type of each unit responding, call type (as determined by dispatch), prime situation (field observation), actions taken, and property loss. 

For the sake of this exercise, I just included 11 columns: 
- id
- address
- incident_date
- city
- zipcode
- battalion
- station_area
- action_taken_primary
- property_use
- ignition_cause
- neighborhood_district
- point

### Assumption 1: stg_incidents
Let's establish, the Business required a small version of these table for a report, just with the following fields: incident_id (should be unique and not null values), address, battalion, time_period, district (not null values), point

### Assumption 1: stg_incidents_district
Using the previous cleaned table as a base, create a view to see all the fire incidents that have been place by district. Business wants to see: district (unique and not null values), times_happened, first_fire (first time that the incident took place), last_fire (most recent fire)


### Run the containers:

First, let’s build the images
```
docker-compose build
```

Then, let’s spin up the running containers
```
docker-compose up
```

This command should have initialized a Postgres database and created the dbt models specified. For now, let’s make sure you have two running containers with the command:

```
docker ps
```

### Query the models on Postgres database:
In order to access the Postgres container, you’ll first need to infer the container id, so execute the previous command. Then, run:
```
docker exec -it <container-id> /bin/bash
```

We will then need to use psql, a command-line interface that gives us access the postgres instance:
```
psql -U postgres
```

Now, you are able to query the models created within the Postgres container:

```
-- clean table
select * from stg_incidents;

-- materialized view
select * from stg_incidents_district;
```

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
