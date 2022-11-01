# Directus NextBits Project

### Setup Steps :
- clone the repository
    ```sh
  git clone https://github.com/saurabhnextbits/directus_new.git
    ```
- Rename .env.example file to .env
    if database credential change then update following lines with new credential
    ```sh
    DB_CLIENT="pg"
    DB_HOST="127.0.0.1"
    DB_PORT="5432"
    DB_DATABASE="directus"
    DB_USER="postgres"
    DB_PASSWORD="test@123"
    DB_SSL="false"
    ```
- Install Package 
    ```sh 
    npm install
    ```

- Restore postgres datbase with database.sql
  or Run
  ```sh
  npx directus bootstrap
    ```
    for initial table setup
- Start Server 
    ```sh
    npm run start
    ```

- If existing database is not used then create following data models
     ###  1. nextbits_timesheet
            id
            status
            sort
            user_created
            date_created
            user_updated
            date_updated
            department            -                        string
            notes                 -                        string
            project               -                        string
            timestamp             -                        float
            time                  -                        float
            date                  -                        DateTime
        

     ###  2. nextbits_department
            id
            status
            sort
            user_created
            date_created
            user_updated
            date_updated
            name                    -                      string
        
    ###  3. nextbits_project
            id
            status
            sort
            user_created
            date_created
            user_updated
            date_updated
            code - string
            name                    -                      string
        
     (Note: Screenshots of data model available in data-model-screenshot folder)


