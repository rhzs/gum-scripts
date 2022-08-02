## Author: Rheza Satria (c) 2022

#!/bin/sh

function klogs() {
    kubectl get pod | \
        awk 'NR != 1{split($0,a," "); print a[1]}' | \
        gum choose | \
        xargs -I {} kubectl logs po/{} -f
}

function ksvc() {
    kubectl get svc | \
        awk 'NR != 1{split($0,a," "); print a[1]}' | \
        gum choose | \
        xargs -I {} kubectl describe svc/{}
}

function kpo() {
    kubectl get pod | \
        awk 'NR != 1{split($0,a," "); print a[1]}' | \
        gum choose | \
        xargs -I {} kubectl describe po/{}
}

function kctx() {
    kubectl ctx | gum choose | xargs kubectl ctx
}

function kns() {
    kubectl ns | gum choose | xargs kubectl ns
}
