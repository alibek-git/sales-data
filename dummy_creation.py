import csv
import random
from faker import Faker

fake = Faker()

activity_types = [
    'Registration',
    'Discovery call booked',
    'Discovery call completed',
    'Proposal',
    'Won'
]

def generate_dummy_data(num_records):
    dummy_data = []

    # Generate Registration data
    for _ in range(num_records):
        registration_data = {
            'activity_type': 'Registration',
            'timestamp': fake.date_time_this_year(),
            'user_id': fake.random_number(digits=6),
            'description': fake.sentence()
        }
        dummy_data.append(registration_data)

    # Generate Discovery call booked data
    discovery_call_booked_count = int(num_records * random.uniform(0.55, 0.70))
    registration_indices = list(range(num_records))
    discovery_call_booked_indices = random.sample(registration_indices, discovery_call_booked_count)
    for index in discovery_call_booked_indices:
        data = dummy_data[index].copy()
        data['activity_type'] = 'Discovery call booked'
        data['timestamp'] = fake.date_time_between(start_date=data['timestamp'])
        dummy_data.append(data)

    # Generate Discovery call completed data
    discovery_call_completed_count = int(discovery_call_booked_count * random.uniform(0.70, 0.90))
    discovery_call_booked_indices = list(range(num_records, len(dummy_data)))
    discovery_call_completed_indices = random.sample(discovery_call_booked_indices, discovery_call_completed_count)
    for index in discovery_call_completed_indices:
        data = dummy_data[index].copy()
        data['activity_type'] = 'Discovery call completed'
        data['timestamp'] = fake.date_time_between(start_date=data['timestamp'])
        dummy_data.append(data)

    # Generate Proposal data
    proposal_count = int(discovery_call_completed_count * random.uniform(0.35, 0.70))
    discovery_call_completed_indices = list(range(len(dummy_data) - discovery_call_completed_count, len(dummy_data)))
    proposal_indices = random.sample(discovery_call_completed_indices, proposal_count)
    for index in proposal_indices:
        data = dummy_data[index].copy()
        data['activity_type'] = 'Proposal'
        data['timestamp'] = fake.date_time_between(start_date=data['timestamp'])
        dummy_data.append(data)

    # Generate Won data
    won_count = int(proposal_count * random.uniform(0.40, 0.80))
    proposal_indices = list(range(len(dummy_data) - proposal_count, len(dummy_data)))
    won_indices = random.sample(proposal_indices, won_count)
    for index in won_indices:
        data = dummy_data[index].copy()
        data['activity_type'] = 'Won'
        data['timestamp'] = fake.date_time_between(start_date=data['timestamp'])
        dummy_data.append(data)

    return dummy_data

# Generate 2000 dummy records
dummy_records = generate_dummy_data(2000)

# Specify the output file path
output_file = 'dummy_records.csv'

# Write the dummy records to a CSV file
with open(output_file, 'w', newline='') as csvfile:
    fieldnames = ['activity_type', 'timestamp', 'user_id', 'description']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()
    for record in dummy_records:
        writer.writerow(record)
