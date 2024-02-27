❗**Note**: As of December 26, 2023, the trial Google Cloud account has expired, rendering the associated resources unavailable.

</br>

## Task 8: Bringing it all together

</br>

### Goal 🎯 </br> 
The goal of this task was to create static website hosted on GCS bucket using Terraform and Github Actions CI/CD pipeline 
</br>
</br>

:office:**Architecture**
</br>
</br> 
![cloud1 drawio](https://github.com/IKRadwan/DareIT-Task-8/assets/146995869/09d9a925-ee61-49ed-ac5a-f4bfdfd6a1d7)
</br>
  - Githut repository contains of static website, config files for terraform and workflow file
  - Everytime there are new pushes to the repository or new pull requests opened, workflow is triggered and Terraform setups Cloud infrastructure
  - Website is hosted on GCP bucket, where files are being updated during workflow runs
  - website is available via public URL: [https://storage.googleapis.com/dareit_task8_bucket/website/index.html](https://storage.googleapis.com/dareit_task8_terraform/website/index.html)

Proposed architecture allows to automatically deploy website right after pushing new commits and opening new pull requests
</br>
</br> 

:open_hands:**Task summary and conclusions**
</br>
</br> 
•	The content of website has been not taken into consideration for developing – it only contains Lorem ipsum text and an image, as displayed below

![image](https://github.com/IKRadwan/DareIT-Task-8/assets/146995869/f45e7783-1418-41ef-95f1-ced642badc4e)

•	GCP bucket was selected for hosting the website and deployment is perfomed only via Github workflow using Terraform as it is sufficient for small projects like this. For more complex applications, other solutions should be chosen, i.e. Kubernetes cluster (GKE)
 
•	Website can be updated on the separate branch test before being merge to main. In a real world situation, there would be a develop/test environment to test the changes first (e.g. modifying, adding new resources within main.tf or modifying website content) and avoid deploying changes in production environment (changes on main branch)

•	To deploy website folder on GCP, gsutil tool and and rsync Linux command have been considered in terraform.yml. This is because it’s easier to use Linux command than terraform config file to update the content of folder. However,  using only Terraform commands guarantee to keep only desired files in the bucket if some changes with folder name occur.

</br>
</br>  

:bulb:**To do/improve**
</br>
</br> 
  - page displayed under public URL is not updated instantly after deployment. Probably GCP uses some kind of cache mechanism to reduce resource utilization
  - for small applications like this static website, scaling was not taken into consideration as Google provide autoscaling for buckets
  - for GCP buckets, there are some scaling out techniques that can be helpful for more complex projects
    - using Content Delivery Network
    - distribution with Load Balancers
    - multi-regional buckets
</br>
</br>

:wrench:**All VPCs and Subnets in the project**

</br>
  - as part of this task, the Cloud Function has been developed that lists all VPCs and Subnets in the project and saves the data in a file that is stored in a bucket </br>
  - Python script of the function (main.py) along with requirements.txt have been added to the repository </br>
  - Cloud Function has been successfully deployed but as 500 Internal Server Error occured during execution, the code and logs require further investigation to fix that </br>
  
  [trigger URL](https://europe-west1-fleet-resolver-401019.cloudfunctions.net/list_vpcs_and_subnets)




