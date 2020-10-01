This is a Rails application of a simple Photosite.

# **Section 1**

Welcome to the Photosite Home page! 

**# Description ** Application Name: Photosite in Ruby on Rails using SQLlite Database 

In this project the first url:user/index will display the a webpage that lists the information of all the users (userid, first name, last name). Clicking on the users first name , which is a link will navigate to the second url :/photo/index/id .This page will display the user photo, photo creation time , comments on that photo and comment created time, name of the user who commented.

# **Section 2**

Demonstration of Project:```` This is the first page showing the list of users with their id’s and names. Here the ‘first-name’ should be a link to the user’s respective page containing their photos and comments. I have the user id as the link.


![user_index](https://user-images.githubusercontent.com/50223742/94516902-b620ca80-01db-11eb-8d5a-73afd958a702.png)

Given below are examples of the pages of each user, displaying their photo, comments and date.

![user_id](https://user-images.githubusercontent.com/50223742/94517136-229bc980-01dc-11eb-8409-ec60cc5defc0.png)

![photo_user_link](https://user-images.githubusercontent.com/50223742/94517280-773f4480-01dc-11eb-93a2-3defb697006c.png)

The photos are uploaded in Amazon AWS S3 bucket with bucket name : vaibhavphotosite as shown in below screenshot

![S3 bucket](https://user-images.githubusercontent.com/50223742/94529839-179e6480-01ef-11eb-96c6-c31fa1f738bf.png)

Here one can see in "inspect" page that source of images is AWS S3 bucket vaibhavphotosite

 ![bucket link in image](https://user-images.githubusercontent.com/50223742/94529948-3bfa4100-01ef-11eb-9d30-c270a7ec4a8e.png)

# **Section 3**

Docker container

We create a Docker image with Dockerfile and push it to our Docker Hub

**Step 1**

Create Dockerfile

![dockerfile](https://user-images.githubusercontent.com/50223742/94772531-b0a7b980-036e-11eb-8bfb-5a5122607f18.png)

**Step 2**

create docker image with following command

_docker image build -t vaibhav1108/photosite-web ._

![5](https://user-images.githubusercontent.com/50223742/94772403-69b9c400-036e-11eb-901f-32722356293d.png)

**Step 3**

Provision a docker container with the image created via following command

 docker run -p 3000:3000 vaibhav1108/photosite-web

We can see list of images created as below:

![7](https://user-images.githubusercontent.com/50223742/94772436-776f4980-036e-11eb-8771-f3b4075cf49e.png)

**Step 4**

Login to docker and push our Docker image to Docker Hub

_docker login_

![7](https://user-images.githubusercontent.com/50223742/94772436-776f4980-036e-11eb-8771-f3b4075cf49e.png) 

_docker push vaibhav1108/photosite-web_


![8](https://user-images.githubusercontent.com/50223742/94772453-80f8b180-036e-11eb-824c-53fa25ea78e7.png)

Now we can see our docker hub has repository created


![docker hub](https://user-images.githubusercontent.com/50223742/94772494-9c63bc80-036e-11eb-9837-8b2405b95fdc.png)


**Step 5**

**EC2**

Launch EC2 instance with following screenshots of settings

![ec2 instance ami](https://user-images.githubusercontent.com/50223742/94535930-fccfee00-01f6-11eb-95ad-f9b45fa055ce.png)

![ec2 instance storage](https://user-images.githubusercontent.com/50223742/94536072-2c7ef600-01f7-11eb-85c0-c9934d36c2f0.png)

![ec2 review](https://user-images.githubusercontent.com/50223742/94536175-4f110f00-01f7-11eb-9994-055707c10a70.png)


Now we can see our EC2 instance running 

![instance run](https://user-images.githubusercontent.com/50223742/94772588-d0d77880-036e-11eb-9900-4081813285af.png)

Next is connecting to our instance

**Step 6**

We will use SSH client Putty for connecting to our instance

Add public IPv4 address of our instance in host/IP address field of Putty

![putty1](https://user-images.githubusercontent.com/50223742/94772651-f2386480-036e-11eb-85fe-73d769f63013.png)

Type in the username in "Data" tab of Putty, in my case it is:

_"ubuntu"_

![putty2](https://user-images.githubusercontent.com/50223742/94772670-fe242680-036e-11eb-9984-d3de9341e4db.png)

Browse and put in the private key for our instance (.ppk version converted from .pem version, through puttygen)

![putty3](https://user-images.githubusercontent.com/50223742/94772695-08462500-036f-11eb-858c-19fa7b968c25.png)

Next click open, and our instance should be connected

![9](https://user-images.githubusercontent.com/50223742/94772471-8eae3700-036e-11eb-9f0d-9af75c6ca2fc.png)

**Step 7**

Install Docker on our EC2 instance with following commands

_sudo apt-get update_

_sudo apt-get install docker-ce docker-ce-cli containerd.io_

![10](https://user-images.githubusercontent.com/50223742/94773298-54459980-0370-11eb-9492-818725c33f41.png)


**Step 8**

Pull docker image from docker hub

_docker pull vaibhav1108/photosite-web_

![10](https://user-images.githubusercontent.com/50223742/94773298-54459980-0370-11eb-9492-818725c33f41.png)


**Step 9**

Add User to docker group to run docker commands without sudo


sudo usermod -aG docker ${USER}

![10](https://user-images.githubusercontent.com/50223742/94773298-54459980-0370-11eb-9492-818725c33f41.png)


Step 10

run docker container

_docker run -p 3000:3000 vaibhav1108/photosite-web_

![docker running on ec2](https://user-images.githubusercontent.com/50223742/94772514-a5ed2480-036e-11eb-9875-583c5e2b5112.png)

And now in browser use EC2 instance's public IPv4 address combined with port in use to see our photosite-web app running on our EC2 instance

http://13.58.189.183:3000/user

We can see our user page here

![photosite web app running on EC2](https://user-images.githubusercontent.com/50223742/94772636-e482df00-036e-11eb-800c-ae5497c984c0.png)

This is one of the photos page

![photos page on ec2](https://user-images.githubusercontent.com/50223742/94772604-da60e080-036e-11eb-9f8e-348c00154fce.png)

# **Section 4**

Discussion of part not implemented

Everything running successfully

Project Status: Successfully completed project. 

Indcluded all aspects - Docker push, Amazon Instance, Image pull and Application run.


# **Section 5**

Special Issue 1 When an instance stops running we can freeze it by using AMIs (Amazon Machine Image). This will store a state of the application and there won't be any data loss. For Complete implementation we need to create an Amazon S3 bucket and export this EC2 image to it. 

# **Section 6**

Special Issue 2 The solution to IP address changing is creating Elastic IPs. In EC2 we can create elastic IPs and allocate them to one instance. This way we can have the same IP even if the Instance stops or reboots.

# **Section 7**

In Amazon EC2 the user has to do most of the installation (of ruby, gems, etc.) and push/pull of images. In ElasticBeanstalk this is done automatically. Another difference is that EBS is completely free of cost unlike EC2.


# **Section 8**

Photosite application using AWS S3 bucket Youtube Demo: https://www.youtube.com/watch?v=a2Qx8WrQzaA
Photosite application running on EC2 using docker container Youtube Demo: https://youtu.be/VwuoKZlWm44

