<!-- This file was automatically generated by the `geine`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->
[![Banner](https://github.com/clouddrove/terraform-module-template/assets/119565952/67a8a1af-2eb7-40b7-ae07-c94cde9ce062)][website]
<h1 align="center">
    Terraform AWS Cloudwatch Alarms
</h1>

<p align="center" style="font-size: 1.2rem;">
    With our comprehensive DevOps toolkit - streamline operations, automate workflows, enhance collaboration and, most importantly, deploy with confidence.
</p>


<p align="center">

<a href="https://github.com/clouddrove/terraform-aws-cloudwatch-synthetics/releases/latest">
  <img src="https://img.shields.io/github/release/clouddrove/terraform-aws-cloudwatch-synthetics.svg" alt="Latest Release">
</a>
<a href="https://github.com/clouddrove/terraform-aws-cloudwatch-synthetics/actions/workflows/tfsec.yml">
  <img src="https://github.com/clouddrove/terraform-aws-cloudwatch-synthetics/actions/workflows/tfsec.yml/badge.svg" alt="tfsec">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>
<a href="CHANGELOG.md">
  <img src="https://img.shields.io/badge/Changelog-blue" alt="Changelog">
</a>


</p>
<p align="center">

<a href='https://facebook.com/sharer/sharer.php?u=https://github.com/clouddrove/terraform-aws-cloudwatch-alarms'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.instagram.com/cloud_drove?igsh=cHJqaDY3bGtnYmh3' title="Follow On Instagram">
  <img src="https://github.com/gauravghongde/social-icons/blob/master/SVG/Color/Instagram.svg" width="23" height="23" />
</a>
<a href='https://www.linkedin.com/shareArticle?mini=true&title=Terraform+AWS+Cloudwatch+Alarms&url=https://github.com/clouddrove/terraform-aws-cloudwatch-alarms'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>
<a href='https://twitter.com/intent/tweet/?text=Terraform+AWS+Cloudwatch+Alarms&url=https://github.com/clouddrove/terraform-aws-cloudwatch-alarms'>
  <img title="Share on Twitter" src="https://user-images.githubusercontent.com/50652676/62817740-4c69db00-bb59-11e9-8a79-3580fbbf6d5c.png" />
</a>

</p>
<hr>


We are a group of DevOps engineers & architects, joining hands in this ever evolving digital landscape. With our strong belief in Automation; just like microservices, always on the lookout to split the the infrastructure into smaller connected resources (database, cluster and more) which could be standardized, are manageable, scalable, secure & follow industry best practices. 


This module includes Terraform open source, examples, and automation tests (for better understanding), which would help you create and improve your infrastructure with minimalistic coding.




## Prerequisites and Providers

This table contains both Prerequisites and Providers:

| Description   | Name                                       | Version   |
|:-------------:|:-------------------------------------------:|:---------:|
| **Prerequisite** | [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) | >= 1.6.6 |
| **Provider** | [aws](https://aws.amazon.com/) | >= 5.31.0 |





## Examples

📌 For additional usage examples, check the complete list under [`examples/`](./examples) directory.

Here are some examples of how you can use this module in your inventory structure:
### Basic Example
```hcl
  module "target-canary" {
    source = "git::https://github.com/binbashar/terraform-aws-cloudwatch-synthetics.git?ref=FEATURE/improving-module"
  
    name_prefix = "canary"
    environment = "test"
  
    schedule_expression = "rate(5 minutes)"
    s3_artifact_bucket  = "my-test-artifact-bucket" # must pre-exist
    alarm_email         = null      # an email or null value
    endpoints           = { "target-group" = { url = "http://www.binbash.co/" } }
    managedby           = "managedby@binbash.co"
    repository          = "https://github.com/binbashar/terraform-aws-cloudwatch-synthetics"
  
    # what networks it has to work in?
    subnet_ids                = data.terraform_remote_state.local-vpcs.outputs.private_subnets
    security_group_ids        = [aws_security_group.target-canary-sg.id]
  
    tags = local.tags
  
    depends_on = [module.target_canary_s3_bucket, aws_security_group.target-canary-sg]
  }
```

**Note it is using FEATURE/improving-module branch while in development.**






## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alarm\_email | Email address to send alarms to | `string` | n/a | yes |
| create\_topic | Whether or not create the topic, topic_name_suffix required if `false` | `bool` | `true` | yes |
| endpoints | n/a | <pre>map(object({<br>    url = string<br>  }))</pre> | n/a | yes |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| existent\_topic\_arn | If create_topic is `false` this is required and is the arn of an already existent topic | `string` | n/a | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | `[]` | no |
| managedby | ManagedBy, eg 'CloudDrove'. | `string` | `"managedby@binbash.co"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/binbashar/terraform-aws-cloudwatch-synthetics"` | no |
| runtime_version | Runtime version for the lambda. | `string` | `syn-nodejs-puppeteer-6.2` | no |
| s3\_artifact\_bucket | Location in Amazon S3 where Synthetics stores artifacts from the test runs of this canary | `string` | n/a | yes |
| schedule\_expression | Expression defining how often the canary runs | `string` | n/a | yes |
| security\_group\_ids | IDs of the security groups for this canary | `list(string)` | `null` | no |
| subnet\_ids | IDs of the subnets where this canary is to run | `list(string)` | `null` | no |
| topic\_name\_suffix | Topic name suffix, will be prepended with name_prefix | `string` | n/a | yes |
| tags | The json object with tags to be added to resources | `map(string)` | n/a | yes |


## Outputs

| Name | Description | 
|------|-------------|
| topic_arn | The ARN for the alarm topic (whether it is created or already existent, see `create_topic` input) |







## Feedback 
Spot a bug or have thoughts to share with us? Let's squash it together! Log it in our [issue tracker](https://github.com/clouddrove/terraform-aws-cloudwatch-alarms/issues), feel free to drop us an email at [hello@clouddrove.com](mailto:hello@clouddrove.com).

Show some love with a ★ on [our GitHub](https://github.com/clouddrove/terraform-aws-cloudwatch-alarms)!  if our work has brightened your day! – your feedback fuels our journey!


## :rocket: Our Accomplishment

We have [*100+ Terraform modules*][terraform_modules] 🙌. You could consider them finished, but, with enthusiasts like yourself, we are able to ever improve them, so we call our status - improvement in progress.

- [Terraform Module Registry:](https://registry.terraform.io/namespaces/clouddrove) Discover our Terraform modules here.

- [Terraform Modules for AWS/Azure Modules:](https://github.com/clouddrove/toc) Explore our comprehensive Table of Contents for easy navigation through our documentation for modules pertaining to AWS, Azure & GCP. 

- [Terraform Modules for Digital Ocean:](https://github.com/terraform-do-modules/toc) Check out our specialized Terraform modules for Digital Ocean.




## Join Our Slack Community

Join our vibrant open-source slack community and embark on an ever-evolving journey with CloudDrove; helping you in moving upwards in your career path.
Join our vibrant Open Source Slack Community and embark on a learning journey with CloudDrove. Grow with us in the world of DevOps and set your career on a path of consistency.

🌐💬What you'll get after joining this Slack community:

- 🚀 Encouragement to upgrade your best version.
- 🌈 Learning companionship with our DevOps squad.
- 🌱 Relentless growth with daily updates on new advancements in technologies.

Join our tech elites [Join Now][slack] 🚀


## Explore Our Blogs

 Click [here][blog] :books: :star2:

## Tap into our capabilities
We provide a platform for organizations to engage with experienced top-tier DevOps & Cloud services. Tap into our pool of certified engineers and architects to elevate your DevOps and Cloud Solutions. 

At [CloudDrove][website], has extensive experience in designing, building & migrating environments, securing, consulting, monitoring, optimizing, automating, and maintaining complex and large modern systems. With remarkable client footprints in American & European corridors, our certified architects & engineers are ready to serve you as per your requirements & schedule. Write to us at [business@clouddrove.com](mailto:business@clouddrove.com).

<p align="center">We are <b> The Cloud Experts!</b></p>
<hr />
<p align="center">We ❤️  <a href="https://github.com/clouddrove">Open Source</a> and you can check out <a href="https://registry.terraform.io/namespaces/clouddrove">our other modules</a> to get help with your new Cloud ideas.</p>

  [website]: https://clouddrove.com
  [blog]: https://blog.clouddrove.com
  [slack]: https://www.launchpass.com/devops-talks
  [github]: https://github.com/clouddrove
  [linkedin]: https://cpco.io/linkedin
  [twitter]: https://twitter.com/clouddrove/
  [email]: https://clouddrove.com/contact-us.html
  [terraform_modules]: https://github.com/clouddrove?utf8=%E2%9C%93&q=terraform-&type=&language=
