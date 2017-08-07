DemTools CiviCRM Tests
======================

This project aims to develop behaviour tests for DemTools CiviCRM using Behat.


Usage
-----

For installation and setup, see below.

Navigate to the repository, as installed on your server:

    $ cd ~/demtools-civicrm-tests   # This is the default, for now.

Drumkit should already be installed as a git submodule. We need to bootstrap
it, in order to inject some environment variables. We'll need to do this every
time we start a new shell session:

    $ . d

We can then check that Behat is properly installed like so:

    $ behat --version
    behat version 3.1.0

Next, we need to tell Behat which site we want to run our tests against. The
first step is to find the proper Drush alias for the site we want:

    $ drush sa |grep chris
    @chris-test.demcloud.org

With that, we can build the the additional environment variable that we'll use
to tell Behat which site to use:

    $ drush @chris-test.demcloud.org bde-env-gen
    export BEHAT_PARAMS='{"extensions":{"Behat\\MinkExtension":{"base_url":"http://chris-test.demcloud.org"},"Drupal\\DrupalExtension":{"drupal":{"drupal_root":"/var/aegir/platforms/demtools-civicrm-20170807"},"drush":{"alias":"chris-test.demcloud.org"},"subcontexts":{"paths":["/var/aegir/platforms/demtools-civicrm-20170807/sites/all/modules"]}}}}'

You can either copy/paste the result, or inject it directly into the environment by running:

    $ eval $(drush @chris-test.demcloud.org bde-env-gen)

You can check that this worked, by examining the environment variable:

    $ echo $BEHAT_PARAMS
    {"extensions":{"Behat\\MinkExtension":{"base_url":"http://chris-test.demcloud.org"},"Drupal\\DrupalExtension":{"drupal":{"drupal_root":"/var/aegir/platforms/demtools-civicrm-20170807"},"drush":{"alias":"chris-test.demcloud.org"},"subcontexts":{"paths":["/var/aegir/platforms/demtools-civicrm-20170807/sites/all/modules"]}}}}

We're now ready to run our tests:

    $ behat
    @api @dashboard
    Feature: CiviCRM homepage dashboard
      In order to conveniently access CiviCRM's primary functionality
      as a CiviCRM Administrator,
      I want to have a dashboard on the frontpage.
    [...]
    12 scenarios (12 passed)
    65 steps (65 passed)
    0m45.40s (59.47Mb)


Setup
-----

To get started, clone this repository:

    $ git clone --recursive https://github.com/nditech/demtools-civicrm-tests
    $ cd demtools-civicrm-tests

This project uses [Drumkit](http://drumk.it) to simplify setting up a testing
tools. First, let's bootstrap it:

    $ . d

Among other things, that will alter your `PATH` temporarily to add a local
`bin` directory where we'll install Behat, Composer and other components of our
test stack.

Next, let's install [Composer](http://getcomposer.org) and [Behat](http://behat.org) and the [Drupal Extension to Behat and Mink](https://behat-drupal-extension.readthedocs.io):

    $ make composer
    ...
    $ composer install
    ...

That should do it. We can test that these components are properly installed by running:

    $ composer --version
    Composer version 1.4.2 2017-05-17 08:17:52
    $ behat --version
    behat 3.1.0


Local Development & Testing
---------------------------

*Note that the instruction below can take an hour or longer to complete. So
prepare accordingly.*

The setup instructions above are sufficient to get up and running with the
testing tools themselves. However, you'll still need to build a DemTools
CiviCRM platform and install a site to run tests on. That's there
[Valkyrie](http://www.getvalkyrie.com) comes into play. It allows you to run a
full [Aegir](http://www.aegirproject.org) server inside of a
[Virtualbox](https://www.virtualbox.org) virtual machine built with
[Vagrant](https://www.vagrantup.com/).

To get started, you'll need to [install
Vagrant](https://www.vagrantup.com/intro/getting-started/install.html) and
[Virtualbox](https://www.virtualbox.org/manual/ch02.html#idm929). Once you've
done that, you can verify that they are properly installed by running the
following:

    $ vagrant --version
    Vagrant 1.8.5
    $ virtualbox --help
    Oracle VM VirtualBox Manager 5.1.14
    [...]

Now we're ready to install [Drush](http://drush.org) and Valkyrie:

    $ make drush
    [...]
    $ vagrant up
    [...]

Finally, you should see a welcome message that includes a login link to your
newly installed Aegir server. The easiest way to access it is to type:

    $ drush @v uli

This ought open a new browser window and log you into the Aegir site
automatically. This is a fully functional Aegir system, so it might be
worthwhile to check out the [Aegir documentation](http://docs.aegirproject.org)
before proceeding.

