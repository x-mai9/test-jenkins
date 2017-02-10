class LinterFalse {
	constructor(text) {
		this.text = text;
	}

    setText(text) {
		this.text = text;
	}
  
	displayText() {
		return this.text;
	}
}

function needJsDoc() {
	return null;
}