#create DB password
oc create -f postgresSecret.yaml -n openshift-pipelines

# create certificate sercet
oc create -f ./certSecret.yaml -n openshift-pipelines

# download install yaml
curl https://storage.googleapis.com/tekton-releases/results/previous/v0.3.0/release.yaml --output ./results-release.yaml

# replace namespace
sed -i "" 's/namespace: tekton-pipelines/namespace: openshift-pipelines/g' results-release.yaml
sed -i "" "s/image: postgres.*/image: registry.redhat.io\/rhel8\/postgresql-12:latest/g" results-release.yaml
sed -i "" 's/tekton-pipelines.svc.cluster.local/openshift-pipelines.svc.cluster.local/g' results-release.yaml

# install tekton-results 
oc apply -f ./results-release.yaml



chmod: changing permissions of '/var/lib/postgresql/data': Operation not permitted
chmod: changing permissions of '/var/run/postgresql': Operation not permitted
The files belonging to this database system will be owned by user "1000660000".
This user must also own the server process.
The database cluster will be initialized with locale "en_US.utf8".
The default database encoding has accordingly been set to "UTF8".
The default text search configuration will be set to "english".
Data page checksums are disabled.
fixing permissions on existing directory /var/lib/postgresql/data ... initdb: error: could not change permissions of directory "/var/lib/postgresql/data": Operation not permitted