#!/bin/bash


PROM_OPERATOR_RELEASE=prom-operator

setup_prometheus_operator(){
	kubectl create namespace monitoring ||true

	helm3 upgrade -i ${PROM_OPERATOR_RELEASE} \
	      stable/prometheus-operator \
	       --namespace monitoring -f operator.yaml
}

setup_prometheus_adapter(){

	kubectl apply -f ./metric-adapter
	#zalando adapter has no implementation for helm chart

}

setup_prometheus_operator
#setup_prometheus_adapter
