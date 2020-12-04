#!/bin/bash

# script to generate kubeconfig of created eks

if [ -f ~/.kube/config ]; then
	echo "Taking backup of existing kubeconfig"
	cp ~/.kube/config ~/.kube/config-$(date +%s)
	rm -f ~/.kube/config
fi

aws eks --region $(terraform output region) update-kubeconfig --name $(terraform output cluster_name)
