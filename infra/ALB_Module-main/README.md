### CREATED BY SHREYA SRIVASTAVA
This Terraform code enables the dynamic creation of AWS Application Load Balancers (ALBs) and associated resources, offering flexibility through:

1. **Dynamic Resource Creation**: Easily scale infrastructure by dynamically creating ALBs, target groups, listeners, and listener rules based on input variables.

2. **Configurable Attributes**: Tailor resource configurations with customizable attributes such as name, port, protocol, health check settings, and tags.

3. **Conditional Resource Creation**: Choose to include HTTPS support based on the `create_https_listener` variable, allowing flexibility in security configurations.

4. **Tagging**: Organize and manage resources effectively with tagging for cost allocation, tracking, access control, and automation.

5. **Target Group Health Check Customization**: Adjust health check parameters like healthy threshold, unhealthy threshold, and interval based on application requirements, enhancing flexibility in monitoring and scaling strategies.
