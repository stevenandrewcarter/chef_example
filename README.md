# chef_example Cookbook

This is a simple example cookbook that will configure a machine with some of the
basic options. The cookbook will install a couple of applications so that a simple
web server will be available. You may use this cookbook freely to learn and
understand the different aspects of chef.

This cookbook is mostly concerned with running test kitchen, and as such requires
that the following components are installed and ready.

To run test kitchen ensure that the following commands are executed in the location
that the chef cookbook is located
```
vagrant box add hashicorp/precise64
berks
kitchen converge
```
which will download the base vagrant box that the machine will use, and then create
a new virtual machine from the cookbook.

The command `vagrant box add hashicorp/precise64` downloads a base vagrant box
from hashicorp. This is important as the rest of the process will use the base box
and install the additional applications on top of it.

The command `berks` downloads any cookbook dependencies for the cookbook. [BerkShelf][7]
is a tool that downloads cookbooks from the [Chef Supermarket][8] as defined in
the Berksfile.

The command `kitchen converge` executes the [Test Kitchen][9] tooling. This will
build a new virtual machine on VirtualBox and provision the machine using the chef
recipe defined in the `.kitchen.yml`.

Once a machine has been successfully converged, you can access the machine via
`kitchen login`. This will login into the machine using the default shell. In
addition you can run `kitchen destroy` to remove the created machine at any point.

## Requirements

This cookbook requires that [VirtualBox][1] and [vagrant][2] are installed. [Chef][3]
will also be required and in particular ensure that the command line tools are
correctly installed. It should run on any os as long as the vagrant box is retrieved first.

### Platforms

- macOS, Linux, Windows. Pretty much anything that supports chef, vagrant and VirtualBox.
  It is also possible to use a VM to run chef from if the other options don't work.

### VirtualBox

- [VirtualBox][1] 5.1.x or later.

### Vagrant

- [Vagrant][2] 1.8.5 or later.
- [Precise Box][4]. Can get from vagrant by running `vagrant box add hashicorp/precise64`
  on the command line.

### Chef

- [Chef][3] 12.0 or later

### Cookbooks

- `nginx:2.7.6` - [Nginx][5] is required for proxy operations.
- `apache2:3.2.2` - [Apache2][6] is required for displaying webpages.

## Attributes

TODO: List your cookbook attributes here.

e.g.
### chef_example::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['chef_example']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### chef_example::default

TODO: Write usage instructions for each cookbook.

e.g.
Just include `chef_example` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chef_example]"
  ]
}
```

## License and Authors

Authors: Steven Carter

## References

[1]: https://www.virtualbox.org/
[2]: https://www.vagrantup.com
[3]: https://www.chef.io/chef/
[4]: https://www.vagrantup.com/docs/boxes.html
[5]: https://supermarket.chef.io/cookbooks/nginx
[6]: https://supermarket.chef.io/cookbooks/apache2
[7]: http://berkshelf.com/
[8]: https://supermarket.chef.io/
[9]: http://kitchen.ci/
