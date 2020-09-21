#!/bin/bash

setup_jenkins(){

    kubectl create ns jenkins ||true 
    helm3 repo add jenkinsci https://charts.jenkins.io

    helm3 upgrade -i jenkins --set master.hostname=jenkins.eltigre.online \
        --namespace=jenkins \
        -f jenkins-conf.yaml \
	jenkinsci/jenkins
}

setup_jenkins
