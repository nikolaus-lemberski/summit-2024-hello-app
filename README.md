# Hello app

Simple hello app, built with Java and Javalin framework.

## Build

You can use Maven to build the app:

`mvn package`

## Run

After the app is built, start it with Java:

`java -jar target/hello-1.0-jar-with-dependencies.jar`

## Endpoints

Explore the endpoints:

/  
The root path of the app will say Hello!


/health/readiness  
Endpoint for the Kubernetes health checks.


/health/liveness  
Endpoint for the Kubernetes health checks.

## Containerize

A *Containerfile* is provided to pack the app in a container image. You can use **Podman** or **Docker**:

`podman build -t hello .`

And then run the image:

`podman run -p 8080:8080 hello:latest`

A ready to use image is in the quay.io registry:  
*quay.io/nlembers/summit-2024-hello-app:1.0*

## OpenShift deployment

Just apply the *Deployment.yml* file in the *k8s* directory. Check if the pod is created and ready with

`oc get pod -w`

If there's a problem, investigate and fix. When the pod is running and healthy, find the public endpoint with

`oc get route`

And call the route to see if the app prints a greeting!