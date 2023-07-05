# 1. Purpose
This repository was created as a part of the technical screening proccess for the Data Analyst position at [Improvado](improvado.io).
The goal of the assignemnt is to simulate a real-life analytics task while sticking to the principles of the [ActivitySchema](https://github.com/ActivitySchema/ActivitySchema.git). As a scenario it was chosen to simulate the activity of five salespeople of an assumed company, and to analyze their activity and efficiency.

# 2. Plan
This assignment was implemmented by following these steps:<br />
  a. Generate dummy data using Python script;<br />
  b. Upload the generated data into the Google Cloud Storage bucket;<br />
  c. Create datasets in BigQuery using data from GCS;<br />
  d. Use [dbt](cloud.dbt.com) as an IDE for creating models and queries;<br />
  e. Connect to a remote GitHub repository;<br />
  f. Use [Looker Studio](http://lookerstudio.google.com/) as visualization tool on top of the datasource that was generated.<br />

# 3. Structure of this repository
## 3.1 dummy_creation.py
This is the aforementioned script that generates dummy data for a sales funnel simulation. It allows you to generate a specified number of records for each stage of the sales funnel, including Registration, Discovery call booked, Discovery call completed, Proposal, and Won.

  ### 3.1.1 Prerequisites
  - Python 3.x
  - Faker library (`pip install Faker`)

  ### 3.1.2 Usage
  1. Clone the repository or download the script file `dummy_generation.py`.
  2. Install the required Faker library by running the following command:
  pip install Faker

  ### 3.1.3 Open the script file in a text editor and modify the following parameters as needed:
    - `min_leads` and `max_leads`: Specify the range of random leads to be generated.
    - `salesperson_name`: Provide the name of the salesperson.
    - `date_joined`: Specify the date the salesperson joined the company in the format "YYYY-MM-DD HH:MM:SS".

  ### 3.1.4 Run the script using the following command:

    python dummy_generation.py

  ### 3.1.5 The script will generate a CSV file named `dummy_records.csv` containing the generated dummy data.

## 3.2 seeds/
The ["seeds" directory](seeds) contains dummy data that I generated for this particular assignment.

## 3.3 models/
  ### 3.3.1 [models/staging/](models/staging)
  Query to retireve all data from a datasource for every salesperon

  ### 3.3.2 models/business/
  [Model](models/business) to transform the statging files and add two additional columns necessary for our analysis - days_with_company (calculates the number of days a salesperson has been with the company) and time_diff_event_and_joined (calcuates the number of days between when the event happening and when the salesperon joined the company).

  ### 3.3.3 models/marts/core/agg_sales.sql
  [The aggregated model](models/marts/core/agg_sales.sql) that combines the data for all five salespeople.

  ### 3.3.4 models/marts/dim_sales.sql
  [Dimension](models/marts/dim_sales.sql) that aggregates data by salesperson and adds additional metrics to be used in the [Dashboard](https://lookerstudio.google.com/reporting/e34bf8c9-5712-4719-a831-8e538a0a4c98) and the [Sankey Diagram](https://lookerstudio.google.com/reporting/9875fcd4-ad36-45f5-82c3-6839b4de4dfa)

# 4. Acknowledgments
The dummy_creation.py script utilizes the [Faker](https://faker.readthedocs.io/) library for generating realistic fake data.

# 5. License
None
