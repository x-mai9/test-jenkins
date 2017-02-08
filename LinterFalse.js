class LinterFalse {
	/**
	 * @param {string} text Text to display
	 */
   constructor(text) {
		this.text = text;
	}

	/**
	 * @param {string} text Text to set
	 */
	setText(text) {
		this.text = text;
	}

	displayText() {
		return this.text;
	}
}

module.exports = HelloWorld;