# terraform-for-codedeploy


## CODE DEPLOY:
Automates code deployment to any instance, including EC2, Lambda and on-premises.
It allows release of new features, avoid downtime and and avoid manual testing of applications.

### code deployment approaches:
1. inplace: The application is stopped on each instance and new release is instaleed. Also known as rolling update.
2. Blue/Green: New instance are provisioned and the new releases is installed on the new instances. Blue represents the active deployment, green is the new release.

## Appspec structure

1. version
2. operating system
3. files: location of the application files that need to be copied and where they should be copied to.
4. hooks: Scripts which need to run a set of points in the deployment lifecycle. Hoks have very specific run order.

## scripts you might run during a deployment

1. Unzip files
2. Run Tests
3. Deal with load balancing

### RUN ORDER FOR AN IN-PALCE DEPLOYMENT
1. Before: Tasks you want to run on instance before they are de registreed from a load balancer
2. After: Tasks you want to run on the instances after they are de registred from the load balancer
3. Application stop: scripts you need to run to gracefully stop your application.
4. Download bundle: code deploy agents copy the application revision file to a temporary location
5. Before install: Pre-installation scripts.
6. Install: Copy application revision files to final location.
7. ApplicationStart: start any services that were stopped during application set up.
8. AfterInstall: Post-install scripts.
9. Validate service: Runs test to validate service.
10. Afterinstall: Post-install scripts.

### TASK

#### prerequisites

1. create service role to allow EC2 instance to access the source code located in s3 bucket
2. create role for codedeploy to allow codedeploy make API calls on our behalf and to give it permissions to install an application on our EC2 instance.
