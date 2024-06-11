# Before running the service it is necessary to create the loadbalancer and targetgroup in AWS dashboard.

## Creating a loadbalancer

1. **Open the EC2 Console:**
    * Navigate to the EC2 service in your AWS console.
    * Click on "Load Balancers" in the left sidebar.

2. **Create Load Balancer:**
    * Click the "Create Load Balancer" button.
    * Choose "Network Load Balancer" and click "Create."

3. **Configuration:**
    * **Name:** Provide a descriptive name for your load balancer.
    * **Scheme:** Select "internet-facing" for public access or "internal" for access within your VPC.
    * **VPC:** Select the correct VPC.
    * **IP Address Type:** Choose "IPv4" for most cases.
    * **Listeners:** Add a listener on port 80 (HTTP) or 443 (HTTPS).
    * **Availability Zones:** Select the Availability Zones where your instances are running.
    * **Security Groups:** Choose the security groups that control traffic to your load balancer.

4. **Configure Security Groups:**
    * Ensure your security groups allow inbound traffic on the load balancer's listener port (e.g., 80 or 443).
    * For HTTPS, you'll need a valid SSL certificate (you can create one in AWS Certificate Manager).

5. **Configure Routing:**
    * Create a target group. This is a logical group of instances that will receive traffic from the load balancer.
    * Select "Instance" as the target type.
    * Register your EC2 instances with the target group, **make sure to insert the correct proxy port(s)**.
    * Attach the target group to your load balancer's listener.

6. **Review and Create:**
    * Review your configuration carefully.
    * Click "Create load balancer."


## After these steps are completed edit `service.yaml` and replace \<BALANCER IP> with the correct IP address, then run `kubectl apply -f service.yaml`. 
