## Deploying A Stattic Website Using AWS S3 and CLoudFront

- Create a static website and host it on S3 bucket(private bucket)
- Using cloud front for CDN




### Introduction
# Static Website

A static website is just like any regular website. As the name implies, a static website has no dynamic component. A static website is usually made up of plain HTML files, CSS stylesheets, images, as well as Javascript files. It has no capabilities to perform any dynamic request or backend processing, such as processing form data or retrieving information from the database.

`Search for S3 in all services`
![S3 ](img/s3.PNG)

# then enter the bucket name

![S3 ](img/s3Name.PNG)

`Since we want to allow anyone to view our website, I untick the checkbox for Block all public access, and make sure to check the I acknowledge… statement checkbox below it.`
![S3](img/s3Block.PNG)

`Leave all other settings intact & click on the Create bucket button at the bottom of the page.`

![S3](img/s3Create.PNG)

### Upload Website files to S3 Bucket
`After creating a new bucket, click on the bucket name to view the bucket details.`
![S3](img/s3Created.PNG)

## When you create a new bucket it will be always empty. Click on the Upload button to upload some files

![S3](img/s3File.PNG)

## Below is the image of the successfully uploaded file
![S3](img/s3Filed.PNG)

###  Enabling Static Website Hosting on S3 Bucket
`On the Bucket overview page, click on the Properties tab and scroll down.`
`I Look for Static website hosting section and click on the Edit button. `
![S3](img/s3Static.PNG)
`Select Enable option for Static website hosting setting and you will be presented with more options as the following screenshot`
![S3](img/s3Index$error.PNG)
![S3](img/s3savestatic.PNG)

###  Add a Bucket Policy
- Before anyone could access the website on the bucket, we need to explicitly tell S3 Bucket to allow that.

- On the Bucket overview page, click on the Permissions tab, scroll down and look for Bucket policy section, and allow the following configuration.
![S3](img/s3permission.PNG)

![S3](img/s3policy.PNG)

- and click `save changes` button

##### S3 Bucket Website Endpoint in the browser
![S3](img/S3Deployed.PNG)


###### Creating a CloudFront Distribution
- From the top navigation under Services > All Services, 
- search for “CloudFront” and click on it.
![S3](img/cloudfront.PNG)

- On the CloudFront Distributions page, click on the Create distribution button

![S3](img/cloudfrontcreate.PNG)

`On the Create distribution page > under Origin section > for Origin domain > I enter the Amazon S3 static website endpoint `

`Enter “index.html” for Default root object. This file name must match with the index document file name entered previously on S3, and click the create distribution button`

![S3](img/cloudfrontdefault.PNG)

#### CREATED
##### DEPLOYING
![S3](img/cloudfrontcreated.PNG)

`Below is the distribution domain name tested on the browser `
![S3](img/cloudfrontcreateddd.PNG)


