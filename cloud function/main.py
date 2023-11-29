#script anonimized with project id
from google.cloud import compute_v1
from google.cloud import storage
from google.auth import exceptions
import json

def list_vpcs_and_subnets(request):
    try:
        project_id = "<YOUR-PROJECT-ID>"

        # Initialize the Compute Engine client
        compute_client = compute_v1.InstancesClient()

        # List all VPCs
        vpcs = compute_client.aggregated_list(project=project_id).items()
        result = []

        for vpc_name, vpc_list in vpcs:
            if "networks" in vpc_list:
                vpc_info = {"vpc": vpc_name, "subnets": []}
                for network in vpc_list["networks"]:
                    vpc_info["subnets"].append(network["name"])
                result.append(vpc_info)

        # Save the result to Cloud Storage
        bucket_name = "dareit-task8--vpcs-subnets"
        object_name = "vpcs_and_subnets_output.json"
        storage_client = storage.Client()
        bucket = storage_client.bucket(bucket_name)
        blob = bucket.blob(object_name)
        blob.upload_from_string(json.dumps(result), content_type="application/json")

        return {"result": result, "message": f"Output saved to gs://{bucket_name}/{object_name}"}

    except exceptions.DefaultCredentialsError:
        return {"error": "Please run 'gcloud auth application-default login' to authenticate."}