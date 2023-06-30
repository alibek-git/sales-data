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

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

The script utilizes the [Faker](https://faker.readthedocs.io/) library for generating realistic fake data.
