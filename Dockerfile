FROM python:3

RUN apt-get update \
     && apt-get install -y --no-install-recommends

WORKDIR /usr/src/dbt/fire_incidents

# Install the dbt Postgres adapter. This step will also install dbt-core
RUN pip install --upgrade pip
RUN pip install dbt-postgres==1.7.6

# Install dbt dependencies (as specified in packages.yml file)
# Build seeds, models and snapshots (and run tests wherever applicable)
CMD dbt deps && dbt build --profiles-dir profiles && sleep infinity