public with sharing class Dog implements Animal {
	public Dog() {
		
	}

	public void speak() {
		System.debug('The dog goes woof');
	}

	public void eat(String typeOfFood) {
		System.debug('The dog loves ' + typeOfFood);
	}
}