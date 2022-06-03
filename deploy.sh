#create DB password
oc create -f postgresSecret.yaml -n openshift-pipelines

# create certificate sercet
oc create -f ./certSecret.yaml -n openshift-pipelines

# download install yaml
curl https://storage.googleapis.com/tekton-releases/results/previous/v0.3.0/release.yaml --output ./results-release.yaml

# replace namespace
sed -i ./results-release.yaml "s/namespace: tekton-pipelines/namespace: openshift-pipelines/g" results-release.yaml

# install tekton-results 
oc apply -f ./results-release.yaml


