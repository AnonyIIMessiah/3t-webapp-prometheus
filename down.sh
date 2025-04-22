#!/bin/bash

kubectl delete -f .
helm uninstall prometheus --namespace monitoring 

