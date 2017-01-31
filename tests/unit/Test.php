<?php
class Test extends \Codeception\Test\Unit {
    /**
     * @var \UnitTester
     */
    protected $tester;

    protected function _before() {
		
    }

    protected function _after() {
		
    }
	
    public function testSum() {
		$result = 1;
		$this->assertTrue($result==1);
	}
}