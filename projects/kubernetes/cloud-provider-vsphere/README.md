## **Kubernetes vSphere Cloud Provider**
![Version](https://img.shields.io/badge/version-v1.18.1-blue)
![Build Status](https://codebuild.us-west-2.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiYzQ3dzRvZHVqU2MvYnVuMzB3QmRZdVd1U1RabVorWnlqTXBYUGxDSGk2NXJXUU12c3pLQ25CQUdaQmlNUE84S0JIVVZUU0ozeTJJb3J0NWxNejNSbzk4PSIsIml2UGFyYW1ldGVyU3BlYyI6IkhLNTZwQ0hiZDZVUzVRdXYiLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=main)

[Cloud Provider vSphere](https://github.com/kubernetes/cloud-provider-vsphere) defines the vSphere-specific implementation of the Kubernetes controller-manager. The Cloud Provider Interface (CPI) allows customers to run Kubernetes clusters on vSphere infrastructure. It replaces the Kubernetes Controller Manager for only the cloud-specific control loops. The CPI integration connects to vCenter Server and maps information about the infrastructure, such as VMs, disks, and so on, back to the Kubernetes API.

You can find the latest version of this image [on ECR Public Gallery](https://gallery.ecr.aws/l0g8r8j6/kubernetes/cloud-provider-vsphere/cpi/manager).