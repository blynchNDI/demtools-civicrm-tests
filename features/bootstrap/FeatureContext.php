<?php

use Behat\Behat\Tester\Exception\PendingException;
use Drupal\DrupalExtension\Context\RawDrupalContext;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Behat\Hook\Scope\BeforeScenarioScope;


/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawDrupalContext implements SnippetAcceptingContext {

  /**
   * Initializes context.
   *
   * Every scenario gets its own context instance.
   * You can also pass arbitrary arguments to the
   * context constructor through behat.yml.
   */
  public function __construct() {
  }

  /** @var \Behat\MinkExtension\Context\MinkContext */
  private $minkContext;

  /**
   * Load a Mink context.
   *
   * @see: http://behat.org/en/v3.0/cookbooks/accessing_contexts_from_each_other.html
   * @BeforeScenario
   */
  public function gatherContexts(BeforeScenarioScope $scope)
  {
    $environment = $scope->getEnvironment();
    $this->minkContext = $environment->getContext('Drupal\DrupalExtension\Context\MinkContext');
  }

  /**
   * @Then I should see the :button CiviCRM button
   */
  public function IShouldSeeCiviCrmButton($button) {
    return $this->minkContext->assertLinkVisible($button);
  }

  /**
   * @When I press the :button CiviCRM button
   */
  public function IPressCiviCrmButton($button) {
    return $this->minkContext->clickLink($button);
  }



}
