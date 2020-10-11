#! /bin/bash
echo start cluster backuping ....
oc login https://45.135.242.11:8443 -u admin -p admin
mkdir $(date +"%d-%m-%Y")
OPENSHIFT_COM=(DeploymentConfig replicationcontroller buildconfig route service )
for ns in `oc get ns | awk '{print $1}'`  
do
	if [ "$ns" == "NAME"  ]
	then
		continue
	fi

	echo start $ns yaml file backauping ...
	for component_type in ${OPENSHIFT_COM[@]}
	do	
		
		if [ "$component_type" == "NAME" ]
		then
			continue
		fi
		mkdir -p $(date +"%d-%m-%Y")/$ns/$component_type 
		echo $component_type ...
		for components in `oc -n $ns get $component_type | awk '{print $1}'`
		do
			#touch $(date +"%d-%m-%Y")/$ns/$component_type/$components.yaml
			if [ "$components" == "NAME" ]
			then
				continue
			fi
			oc -n $ns get $component_type $components -o yaml > $(date +"%d-%m-%Y")/$ns/$component_type/$components.yaml
			echo $components
		done
	done
done
tar cvfz  "$(date +"%d-%m-%Y")".tar.gz $(date +"%d-%m-%Y")
rm -rf $(date +"%d-%m-%Y")
