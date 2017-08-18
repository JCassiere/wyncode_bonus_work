class PriorityQueue {
	constructor(values) {
		this.queue = values || [];
	}

	insertWithPriority(value) {
		this.queue.push(value);
	}

	getHighestPriority() {
		var maxVal = Math.max(...this.queue);
		if (this.queue.length > 0) {
			this.queue.splice(this.queue.indexOf(maxVal), 1);
		}
		return(maxVal);
	}

	peekHighestPriority() {
		return(Math.max(...this.queue));
	}
}

var testQueue = new PriorityQueue([2, 7, 3, 67, 800, 5]);
console.log(testQueue.getHighestPriority());
console.log(testQueue.peekHighestPriority());
console.log(testQueue.peekHighestPriority());
console.log(testQueue.getHighestPriority());
console.log(testQueue.peekHighestPriority());
