import requests
import json
import pandas as pd


# Link for metadata
META_LINK = 'https://connecteddata.nationalgrid.co.uk/dataset/aggregated-smart-meter-data-secondary-substation/datapackage.json'

# Download the metadata as a JSON
meta_response = requests.get(META_LINK)
meta_json = json.loads(meta_response.text)

# Sets up empty array for all dfs to be stored in
dfs = []

num_resources = len(meta_json['resources']) - 1
cnt = 0

# For each csv in the resource, download the data
for resource in meta_json['resources'][1:]:
    try:
        df = pd.read_csv(resource['url'])

        dfs.append(df)

        cnt += 1
        print(f"Processed resource {cnt}/{num_resources}")
    except Exception as e:
        print(f"Data download failed for {resource['url']}")
        print(e)
        print('-------------------------------------------------------------------------')

combined_df = pd.concat(dfs, ignore_index=True)

combined_df.to_csv('Data\\all_sm_data.csv', index=False)

