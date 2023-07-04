# Models/staging
[Models](models/staging/stg_andy_model.sql) in the "staging" folder contain five models for five salespeople. Source files have 6 columns: activity_type, timestamp, user_id, description, salesperson, and date_joined. Models add two more columns to the table: (1) days_with_company (INT) - difference between current date and the date that the salesperson joined the company, and (2) time_diff_event_and_joined (INT) - difference between an event taking place and a timestamp of when a salesperson joined the company. 

# Models/marts/core
[Aggregated model](models/marts/core/agg_sales.sql) that combines all five models from the "staging" folder. On top of this view there is a [Sankey Diagram](https://lookerstudio.google.com/reporting/9875fcd4-ad36-45f5-82c3-6839b4de4dfa).

# Models/marts/view_won.sql
[This model](models/marts/view_won.sql) is used for building the [Dashboard](https://lookerstudio.google.com/reporting/e34bf8c9-5712-4719-a831-8e538a0a4c98). The table is grouped by Salesperson, and contains columns total_won (sum of all closed (won) deals by the salesperson), then columns that show the coversion rate between each step of the funnel (between Registration and Discovery Call Booked, between Discovery Call Booked and Discovery Call Completed etc.), and finally total conversion (Total Won divided by Total Registrations). In addition, the table has deals_closed_per_week column, which shows the number of deals a salesperson closes per week. Other column include days_with_company, total_leads_received, and average time (days) it takes a salesperson to close (Win) the deal.

# Dummy Data Generation Script

This script generates dummy data for a sales funnel simulation. It allows you to generate a specified number of records for each stage of the sales funnel, including Registration, Discovery call booked, Discovery call completed, Proposal, and Won.

## Prerequisites

- Python 3.x
- Faker library (`pip install Faker`)

## Usage

1. Clone the repository or download the script file `dummy_generation.py`.

2. Install the required Faker library by running the following command:

pip install Faker

3. Open the script file in a text editor and modify the following parameters as needed:

- `min_leads` and `max_leads`: Specify the range of random leads to be generated.
- `salesperson_name`: Provide the name of the salesperson.
- `date_joined`: Specify the date the salesperson joined the company in the format "YYYY-MM-DD HH:MM:SS".

4. Run the script using the following command:

python dummy_generation.py


5. The script will generate a CSV file named `dummy_records.csv` containing the generated dummy data.

## License

None

## Acknowledgments

The script utilizes the [Faker](https://faker.readthedocs.io/) library for generating realistic fake data.
