# terraform-for-codedeploy

![codedeploy](https://user-images.githubusercontent.com/99150197/189550756-d5a218c1-b876-41df-abdd-5046e1aa60ff.jpg)


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


### STEP 1

git clone Frankpromise/aws-code-deploy (github.com)
cd aws-code-deploy
run aws deploy create-application — application-name mywebapp


run aws deploy push — application-name mywebapp — s3-location s3://cd-bucket10/webapp.zip — ignore-hidden-files


click on mywebapp


click on create deployment group


leave everything as default and click create deployment


if everything works, you should see the webpage.

REFERENCES:

A cloud guru

