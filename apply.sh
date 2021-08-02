#!/bin/sh

###################
#Prepare the Env
###################
_MINI=`which minikube`
_KUBE=`which kubectl`
_HELM=`which helm`
NS="default"
PORT_FOR="3000"


deploy() {

    #$_KUBE create ns $NS 
    $_HELM dependency update grafana
    $_HELM install grafana grafana
    echo "`date` | INFO | Sleeping for 15 Sec, waiting for the pod to run"
    sleep 30
    export POD_NAME=$(kubectl get pods -l "app.kubernetes.io/name=grafana,app.kubernetes.io/instance=grafana" -o jsonpath="{.items[0].metadata.name}") >/dev/null
    $_KUBE --namespace $NS port-forward $POD_NAME $PORT_FOR >/dev/null & 
    $_KUBE apply -f deployment.yaml

}

#############
#   MAIN    #
#############

mini_status=`$_MINI status | grep -o Running | wc -l`

if [[ $mini_status -eq 3 ]]
then
    deploy
else
    $_MINI start
    deploy
fi

PROM_SRV=`$_KUBE get svc | grep grafana-prometheus-server | awk '{print $3}'`
PROM_PORT=`$_KUBE get svc | grep grafana-prometheus-server | awk '{print $5}' | cut -d'/' -f1`

echo "`date` | INFO | Garafan domain is : http://localhost:3000"
echo "`date` | INFO | Prometeus Server to connect to Grafana is : http://${PROM_SRV}:${PROM_PORT}"
