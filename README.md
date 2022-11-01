# directus_new

- clone the repository
  git clone https://github.com/saurabhnextbits/directus_new.git

- rename .env.example file to .env
    if database credential change then update following lines with new credential

    DB_CLIENT="pg"
    DB_HOST="127.0.0.1"
    DB_PORT="5432"
    DB_DATABASE="directus"
    DB_USER="postgres"
    DB_PASSWORD="test@123"
    DB_SSL="false"

- npm install

- restore postgres datbase with database.sql
  or 
  npx directus bootstrap

- npm run start

- if existing database is not used then create following data models
  1. nextbits_timesheet
        id
        status
        sort
        user_created
        date_created
        user_updated
        date_updated
        department - string
        notes - string
        project - string
        timestamp - float
        time - float
        date - DateTime

  2. nextbits_department
        id
        status
        sort
        user_created
        date_created
        user_updated
        date_updated
        name - string
  3. nextbits_project
        id
        status
        sort
        user_created
        date_created
        user_updated
        date_updated
        code - string
        name - string
  (Note: Screenshots of data model available in data-model-screenshot folder)



