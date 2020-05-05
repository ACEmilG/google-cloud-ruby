# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

def deploy_model actual_project_id:, actual_model_id:
  # Deploy a model.
  # [START automl_deploy_model]
  require "google/cloud/automl"

  project_id = "YOUR_PROJECT_ID"
  model_id = "YOUR_MODEL_ID"
  # [END automl_deploy_model]
  # Set the real values for these variables from the method arguments.
  project_id = actual_project_id
  model_id = actual_model_id
  # [START automl_deploy_model]

  client = Google::Cloud::AutoML::AutoML.new

  # Get the full path of the dataset
  model_full_id = client.model_path project: project_id, location: "us-central1", model: model_id

  operation = client.deploy_model model_full_id

  # Wait until the long running operation is done
  operation.wait_until_done!

  puts "Model deployment finished."
  # [END automl_deploy_model]
end
