# GitOps Deployment Upgrader

This script automates the process of upgrading a Kubernetes deployment with a newer Docker image, using GitOps practices. It clones a Git repository, updates a **deployment.yaml** file with the specified image tag, commits and pushes the changes to the repository, and removes the cloned directory.

## Prerequisites

- Git must be installed and configured in the system.
- yq tool must be installed in the system.
- The target Kubernetes GitOps repository must exist and be accessible.
- The deployment.yaml file in the target repository must follow the Kubernetes API specification and include a container image field to be updated.

## Usage

### Parameters

- `BRANCH_NAME` (optional): The name of the branch to target. Defaults to "main" if not provided.
- `PUSH_ID` (optional): The name to use for the cloned directory and the commit message. Defaults to "gitops" if not provided.
- `K8S_GITOPS_REPO` (required): The URL of the GitOps repository to clone.
- `DEPLOY_PATH` (required): The DEPLOY_PATH to the **deployment.yaml** file to update, relative to the root of the cloned repository.
- `IMAGE_TAG` (required): The Docker image tag to use for the upgrade.

### Example

- BRANCH_NAME=dev 
- PUSH_ID=f0fac537 preferably a unique id for each run
- K8S_GITOPS_REPO=https://<token>@github.com/myorg/my-k8s-repo.git
- DEPLOY_PATH=myapp/deployment.yaml 
- IMAGE_TAG=v1.2.3


### Script

The script will perform the following steps:

1. Set the Git user email and name to match the latest commit in the repository.
2. Set the target branch to either the provided `BRANCH_NAME` or "main".
3. Set the target ID to either the provided `PUSH_ID` or "gitops".
4. Clone the target repository and checkout the target branch.
5. Navigate to the cloned directory and update the deployment.yaml file with the provided `IMAGE_TAG`.
6. Commit the changes with a message that includes the `DEPLOY_PATH` and `PUSH_ID`.
7. Push the changes to the target branch in the remote repository.
8. Remove the cloned directory.

## License

This script is licensed under the MIT License. See the LICENSE file for details.
# git-patcher
# git-patcher
